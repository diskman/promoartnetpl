param(
    [string]$Root = ".\assets\img\realizacje",
    [int]$MaxDimension = 1920,
    [int]$JpegQuality = 82
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.Drawing

function Get-JpegEncoder {
    return [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
        Where-Object { $_.MimeType -eq "image/jpeg" } |
        Select-Object -First 1
}

function Get-JpegEncoderParameters([int]$Quality) {
    $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters 1
    $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter(
        [System.Drawing.Imaging.Encoder]::Quality,
        [long]$Quality
    )
    return $encoderParams
}

function Invoke-ExifOrientationFix([System.Drawing.Image]$Image) {
    $orientationId = 0x0112
    if (-not ($Image.PropertyIdList -contains $orientationId)) {
        return
    }

    $orientation = $Image.GetPropertyItem($orientationId).Value[0]
    $rotateFlip = switch ($orientation) {
        2 { [System.Drawing.RotateFlipType]::RotateNoneFlipX }
        3 { [System.Drawing.RotateFlipType]::Rotate180FlipNone }
        4 { [System.Drawing.RotateFlipType]::Rotate180FlipX }
        5 { [System.Drawing.RotateFlipType]::Rotate90FlipX }
        6 { [System.Drawing.RotateFlipType]::Rotate90FlipNone }
        7 { [System.Drawing.RotateFlipType]::Rotate270FlipX }
        8 { [System.Drawing.RotateFlipType]::Rotate270FlipNone }
        default { $null }
    }

    if ($null -ne $rotateFlip) {
        $Image.RotateFlip($rotateFlip)
    }

    try {
        $Image.RemovePropertyItem($orientationId)
    }
    catch {
    }
}

function Get-ScaledSize([int]$Width, [int]$Height, [int]$Limit) {
    $maxSide = [Math]::Max($Width, $Height)
    if ($maxSide -le $Limit) {
        return @{ Width = $Width; Height = $Height; Resized = $false }
    }

    $scale = $Limit / [double]$maxSide
    return @{
        Width = [Math]::Max(1, [int][Math]::Round($Width * $scale))
        Height = [Math]::Max(1, [int][Math]::Round($Height * $scale))
        Resized = $true
    }
}

function New-OptimizedBitmap([System.Drawing.Image]$SourceImage, [hashtable]$TargetSize) {
    $bitmap = New-Object System.Drawing.Bitmap $TargetSize.Width, $TargetSize.Height
    $bitmap.SetResolution($SourceImage.HorizontalResolution, $SourceImage.VerticalResolution)

    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    try {
        $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $graphics.Clear([System.Drawing.Color]::Transparent)
        $graphics.DrawImage($SourceImage, 0, 0, $TargetSize.Width, $TargetSize.Height)
    }
    finally {
        $graphics.Dispose()
    }

    return $bitmap
}

$jpegEncoder = Get-JpegEncoder
$jpegEncoderParams = Get-JpegEncoderParameters -Quality $JpegQuality

$files = Get-ChildItem -Path $Root -Recurse -File |
    Where-Object { $_.Extension.ToLowerInvariant() -in @(".jpg", ".jpeg", ".png") }

$summary = [ordered]@{
    Processed = 0
    Updated = 0
    Resized = 0
    JpegReencoded = 0
    Skipped = 0
    Failed = 0
    BeforeBytes = 0L
    AfterBytes = 0L
}

foreach ($file in $files) {
    $summary.Processed++
    $summary.BeforeBytes += $file.Length

    try {
        $image = [System.Drawing.Image]::FromFile($file.FullName)
        try {
            Invoke-ExifOrientationFix -Image $image
            $targetSize = Get-ScaledSize -Width $image.Width -Height $image.Height -Limit $MaxDimension
            $extension = $file.Extension.ToLowerInvariant()

            if ($extension -eq ".png" -and -not $targetSize.Resized) {
                $summary.Skipped++
                $summary.AfterBytes += $file.Length
                continue
            }

            $bitmap = New-OptimizedBitmap -SourceImage $image -TargetSize $targetSize
            $tempPath = Join-Path $file.DirectoryName ([System.IO.Path]::GetRandomFileName() + $extension)

            try {
                if ($extension -in @(".jpg", ".jpeg")) {
                    $bitmap.Save($tempPath, $jpegEncoder, $jpegEncoderParams)
                }
                else {
                    $bitmap.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Png)
                }
            }
            finally {
                $bitmap.Dispose()
            }
        }
        finally {
            $image.Dispose()
        }

        $newFile = Get-Item $tempPath
        $shouldReplace = $newFile.Length -lt $file.Length

        if ($shouldReplace) {
            $originalTimestamp = $file.LastWriteTime
            Remove-Item -LiteralPath $file.FullName -Force
            Move-Item -LiteralPath $tempPath -Destination $file.FullName
            (Get-Item -LiteralPath $file.FullName).LastWriteTime = $originalTimestamp

            $summary.Updated++
            if ($targetSize.Resized) {
                $summary.Resized++
            }
            if ($extension -in @(".jpg", ".jpeg")) {
                $summary.JpegReencoded++
            }
            $summary.AfterBytes += (Get-Item -LiteralPath $file.FullName).Length
        }
        else {
            Remove-Item -LiteralPath $tempPath -Force
            $summary.Skipped++
            $summary.AfterBytes += $file.Length
        }
    }
    catch {
        $summary.Failed++
        $summary.AfterBytes += $file.Length
        Write-Warning ("Nie udalo sie zoptymalizowac: {0} ({1})" -f $file.FullName, $_.Exception.Message)
    }
}

$savedBytes = $summary.BeforeBytes - $summary.AfterBytes
$savedPercent = if ($summary.BeforeBytes -gt 0) {
    [math]::Round(($savedBytes / [double]$summary.BeforeBytes) * 100, 2)
}
else {
    0
}

[pscustomobject]@{
    Processed = $summary.Processed
    Updated = $summary.Updated
    Resized = $summary.Resized
    JpegReencoded = $summary.JpegReencoded
    Skipped = $summary.Skipped
    Failed = $summary.Failed
    BeforeMB = [math]::Round($summary.BeforeBytes / 1MB, 2)
    AfterMB = [math]::Round($summary.AfterBytes / 1MB, 2)
    SavedMB = [math]::Round($savedBytes / 1MB, 2)
    SavedPercent = $savedPercent
} | Format-List
