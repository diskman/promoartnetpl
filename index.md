---
layout: home
title: Welcome to My Jekyll Site!
---

<div class="home-banner mb-16">
  <img src="{{ '/assets/img/banner2.png' | relative_url }}" alt="Promoart banner" class="home-banner__img w-full h-auto object-cover">
</div>

<section class="mb-20">
  <div class="flex justify-between items-end mb-10">
    <div>
      <h2 class="text-3xl font-bold text-gray-900">Aktualności i promocje</h2>
      <p class="text-gray-500 mt-2">Zapoznaj się z najnowszymi promocjami w naszej ofercie</p>
    </div>
  </div>

  <div class="grid md:grid-cols-2 gap-10">
    {% for post in site.posts limit:2 %}
    <article class="group bg-white rounded-3xl overflow-hidden border border-gray-100 shadow-sm hover:shadow-xl transition-all duration-300">
      <div class="aspect-video overflow-hidden relative">
        {% if post.gallery %}
        <img src="{{ post.gallery[0].image | relative_url }}" alt="{{ post.title }}" class="w-full h-full object-cover transition duration-500 group-hover:scale-105">
        {% else %}
        <div class="w-full h-full bg-blue-50 flex items-center justify-center">
          <svg class="w-12 h-12 text-blue-200" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
        </div>
        {% endif %}
      </div>
      <div class="p-8">
        <h3 class="text-2xl font-bold text-gray-900 mb-3 group-hover:text-blue-600 transition-colors">
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </h3>
        <p class="text-gray-600 mb-6 line-clamp-2">{{ post.description }}</p>
        
      </div>
    </article>
    {% endfor %}
  </div>
</section>
