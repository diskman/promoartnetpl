---
layout: default
title: Portfolio
permalink: /realizacje/
projects:
  - name: Reklama zewnętrzna
    description: "Kompleksowa kampania social media dla marki ekologicznej: strategia komunikacji, produkcja kreacji i optymalizacja wynikow."
    gallery:
      - image: "https://picsum.photos/id/1059/1200/800"
        alt: "Projekt GreenWave - kreacja 1"
      - image: "https://picsum.photos/id/1060/1200/800"
        alt: "Projekt GreenWave - kreacja 2"
      - image: "https://picsum.photos/id/1061/1200/800"
        alt: "Projekt GreenWave - kreacja 3"
  - name: Poligrafia
    description: "Odnowienie identyfikacji wizualnej i strony internetowej firmy technologicznej, z naciskiem na nowoczesny UX i czytelna nawigacje."
    gallery:
      - image: "https://picsum.photos/id/180/1200/800"
        alt: "Projekt NovaTech - widok strony 1"
      - image: "https://picsum.photos/id/48/1200/800"
        alt: "Projekt NovaTech - widok strony 2"
      - image: "https://picsum.photos/id/20/1200/800"
        alt: "Projekt NovaTech - widok strony 3"
  - name: Gadżety reklamowe
    description: "Wdrozenie strategii SEO dla lokalnej firmy uslugowej: analiza fraz, optymalizacja tresci i poprawa widocznosci organicznej."
    gallery:
      - image: "https://picsum.photos/id/201/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "https://picsum.photos/id/202/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "https://picsum.photos/id/203/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 3"
  - name: Odzież z nadrukami
    description: "Wdrozenie strategii SEO dla lokalnej firmy uslugowej: analiza fraz, optymalizacja tresci i poprawa widocznosci organicznej."
    gallery:
      - image: "https://picsum.photos/id/201/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "https://picsum.photos/id/202/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "https://picsum.photos/id/203/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 3"
  - name: Oklejanie samochodów
    description: "Wdrozenie strategii SEO dla lokalnej firmy uslugowej: analiza fraz, optymalizacja tresci i poprawa widocznosci organicznej."
    gallery:
      - image: "https://picsum.photos/id/201/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "https://picsum.photos/id/202/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "https://picsum.photos/id/203/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 3"
  - name: Słodycze reklamowe
    description: "Wdrozenie strategii SEO dla lokalnej firmy uslugowej: analiza fraz, optymalizacja tresci i poprawa widocznosci organicznej."
    gallery:
      - image: "https://picsum.photos/id/201/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 1"
      - image: "https://picsum.photos/id/202/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 2"
      - image: "https://picsum.photos/id/203/1200/800"
        alt: "Projekt LocalBoost - analiza i raport 3"
---

<section class="mb-16">
  <h1 class="text-4xl font-extrabold text-gray-900 mb-4">Portfolio</h1>
  <p class="text-lg text-gray-600 leading-relaxed">
    Lista wybranych realizacji. Kazdy projekt zawiera nazwe, opis oraz galerie.
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
</section>
{% endfor %}
