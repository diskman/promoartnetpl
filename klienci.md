---
layout: default
title: Klienci
permalink: /klienci/
description: Nasi klienci i partnerzy.
---

<section class="w-full">
  <header class="mb-8">
    <h1 class="text-4xl font-extrabold text-gray-900 mb-4">Klienci</h1>
    <p class="text-lg text-gray-600">Współpracujemy z markami z różnych branż.</p>
  </header>

  {% assign client_logos = site.static_files | where_exp: "f", "f.path contains '/assets/img/refereces/'" | where_exp: "f", "f.extname == '.png' or f.extname == '.jpg' or f.extname == '.jpeg' or f.extname == '.webp' or f.extname == '.svg'" | sort: "name" %}

  <div class="clients-page-grid grid grid-cols-1 lg:grid-cols-3 gap-6" aria-label="Lista klientów">
    {% for logo in client_logos %}
    <figure class="clients-page-item">
      <img src="{{ logo.path | relative_url }}" alt="{{ logo.name | split: '.' | first }}" loading="lazy">
    </figure>
    {% endfor %}
  </div>
</section>
