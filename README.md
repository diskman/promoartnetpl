# Modern Jekyll Docker Project (Tailwind CSS)

This project is a modern, Dockerized Jekyll setup designed for Windows developers using VS Code. It uses **Tailwind CSS** for styling, providing a clean and professional look without the outdated feel of default themes.

## Features

- **Tailwind CSS Integration**: Fully configured with PostCSS for a modern utility-first workflow.
- **Docker-Powered**: No local Ruby or Node.js installation required on your Windows machine.
- **Live Development**: Automatic rebuilds and browser refresh on every change.
- **Responsive Design**: Pre-built layouts that look great on all devices.

## Quick Start

1. **Extract the project** to your local machine.
2. **Open the folder in VS Code**.
3. **Start the environment**:
   - Run `docker-compose up` in the terminal.
   - Or press `Ctrl+Shift+B` and select "Start Jekyll (Docker Compose)".
4. **Access the site**:
   - URL: [http://localhost:4000](http://localhost:4000)

## How to Customize

- **Styling**: Edit `tailwind.config.js` to change the theme or add plugins. Add custom CSS in `assets/css/main.css`.
- **Layouts**: Modify files in `_layouts/` to change the structure of your site.
- **Content**: Edit `index.md`, `about.md`, and `contact.md` using Tailwind classes directly in the Markdown files.

## Technical Details

- **Jekyll**: v4.3
- **Tailwind CSS**: v3.4
- **PostCSS**: Used to process Tailwind during the Jekyll build process.
- **Docker Image**: Based on Ruby 3.2 with Node.js 20.
