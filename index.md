---
layout: home
title: Welcome to My Jekyll Site!
---

<div class="rounded-2xl mb-16 shadow-lg overflow-hidden">
  <img src="{{ '/assets/img/banner2.png' | relative_url }}" alt="Promoart banner" class="w-full h-auto object-cover">
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
        <div class="absolute top-4 left-4">
          <span class="bg-white/90 backdrop-blur-sm text-blue-600 text-xs font-bold px-3 py-1 rounded-full uppercase tracking-wider shadow-sm">Featured</span>
        </div>
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

<div class="grid md:grid-cols-3 gap-8 border-t border-gray-100 pt-16">
  <div class="bg-gray-50 p-8 rounded-2xl border border-gray-100">
    <div class="w-12 h-12 bg-blue-100 text-blue-600 rounded-xl flex items-center justify-center mb-6">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
    </div>
    <h3 class="text-xl font-bold mb-3 text-gray-900">Fast Execution</h3>
    <p class="text-gray-600">Quick turnaround times without compromising on quality or strategy.</p>
  </div>

  <div class="bg-gray-50 p-8 rounded-2xl border border-gray-100">
    <div class="w-12 h-12 bg-green-100 text-green-600 rounded-xl flex items-center justify-center mb-6">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path></svg>
    </div>
    <h3 class="text-xl font-bold mb-3 text-gray-900">Proven Results</h3>
    <p class="text-gray-600">Our strategies are backed by data and a track record of success.</p>
  </div>

  <div class="bg-gray-50 p-8 rounded-2xl border border-gray-100">
    <div class="w-12 h-12 bg-purple-100 text-purple-600 rounded-xl flex items-center justify-center mb-6">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
    </div>
    <h3 class="text-xl font-bold mb-3 text-gray-900">Expert Team</h3>
    <p class="text-gray-600">Access to specialists in SEO, content, and social media management.</p>
  </div>
</div>
