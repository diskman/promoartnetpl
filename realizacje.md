---
layout: default
title: Portfolio
permalink: /realizacje/
projects:
  - name: Reklama zewnętrzna
    url: /realizacje/reklama-zewnetrzna/
    description: 
    gallery:
      - image: "/assets/img/portfolio/baner1.jpg"
        alt: "Projekt GreenWave - kreacja 1"
      - image: "/assets/img/portfolio/Flaga_radioem.jpg"
        alt: "Projekt GreenWave - kreacja 2"
      - image: "/assets/img/portfolio/DentLove_scianka.jpg"
        alt: "Projekt GreenWave - kreacja 3"
  - name: Poligrafia
    url: /realizacje/poligrafia/
    description: 
    gallery:
      - image: "/assets/img/oferta/folder.jpg"
        alt: "Projekt NovaTech - widok strony 1"
      - image: "/assets/img/portfolio/ulotka_a5.jpg"
        alt: "Projekt NovaTech - widok strony 2"
      - image: "/assets/img/portfolio/Voucher.jpg"
        alt: "Projekt NovaTech - widok strony 3"
  - name: Gadżety reklamowe
    url: /realizacje/gadzety-reklamowe/
    description: 
    gallery:
      - image: "/assets/img/portfolio/smycz.jpg"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "/assets/img/portfolio/otwieracz.jpg"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "/assets/img/portfolio/dlugopis.jpg"
        alt: "Projekt LocalBoost - analiza i raport 3"
  - name: Odzież z nadrukami
    url: /realizacje/odziez-z-nadrukami/
    description: 
    gallery:
      - image: "/assets/img/portfolio/thirt.jpg"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "/assets/img/portfolio/bluza.jpg"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "/assets/img/portfolio/czapka_mostostal.jpg"
        alt: "Projekt LocalBoost - analiza i raport 3"
 
  - name: Słodycze reklamowe
    url: /realizacje/slodycze-reklamowe/
    description: 
    gallery:
      - image: "/assets/img/portfolio/krowki.jpg"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "/assets/img/portfolio/czekoladki.jpg"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "/assets/img/portfolio/wpc.jpg"
        alt: "Projekt LocalBoost - analiza i raport 3"

  - name: Oklejanie pojazdów
    url: /realizacje/oklejanie-pojazdow/
    description: 
    gallery:
      - image: "/assets/img/portfolio/samochod_voster.png"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "/assets/img/portfolio/autobus.jpg"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "/assets/img/portfolio/cupra.jpg"
        alt: "Projekt LocalBoost - analiza i raport 3"
---

<section class="mb-16">
  <h1 class="text-4xl font-extrabold text-gray-900 mb-4">Portfolio</h1>
  <p class="realizacje-description leading-relaxed">
   <span class="realizacje-description-black">Poznaj</span> <span class="realizacje-description-red">nasze dotychczasowe realizacje</span>
  </p>
</section>

{% for project in page.projects %}
<section class="bg-white rounded-3xl border border-gray-100 shadow-sm p-8 mb-12">
  <div class="mb-6">
    <h2 class="text-3xl font-bold text-gray-900 mb-3">{{ project.name }}</h2>
    <p class="text-gray-600 leading-relaxed">{{ project.description }}</p>
  </div>

  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
    {% for item in project.gallery %}
    <figure class="group relative overflow-hidden rounded-2xl bg-gray-100 aspect-video">
      <img src="{{ item.image }}" alt="{{ item.alt }}" class="object-cover w-full h-full transition duration-500 group-hover:scale-110">
    </figure>
    {% endfor %}
  </div>
  <div class="mt-6">
    <a href="{{ project.url | relative_url }}" class="realizacje-gallery-link inline-flex items-center font-semibold transition">
      Zobacz całą galerię
    </a>
  </div>
</section>
{% endfor %}
