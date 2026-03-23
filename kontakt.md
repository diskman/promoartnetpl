---
layout: page
title: Kontakt
permalink: /kontakt/
---

<div class="kontakt-page bg-white rounded-2xl p-10 border border-gray-100 shadow-sm leading-relaxed text-lg text-gray-700 max-w-2xl mx-auto">
  <p class="mb-10 text-center text-gray-600"> 
  <h3 class="text-2xl font-bold text-gray-900 mb-4 border-b pb-2">Agencja reklamowa - Promo<span class="onas-slogan-red">Art</span></h3>
    Jeśli masz pytania dotyczące naszej oferty – skontaktuj się z nami. Chętnie udzielimy szczegółowych informacji, odpowiemy na wszystkie wątpliwości i pomożemy dobrać najlepsze rozwiązania dopasowane do Twoich potrzeb.
  </p>

  <div class="space-y-6">
    <div class="kontakt-card kontakt-card--email flex items-center space-x-6 bg-gray-50 p-6 rounded-2xl border border-gray-200 transition">
      <div class="w-14 h-14 rounded-xl flex items-center justify-center flex-shrink-0">
        <img src="{{ '/assets/img/email.png' | relative_url }}" alt="Email" class="w-8 h-8 object-contain">
      </div>
      <div>
        <p class="text-sm font-bold text-gray-400 uppercase tracking-wider">Email</p>
        <p class="text-xl font-bold ">
          <a id="contact-email-link" href="mailto:biuro@promoart.net.pl" class="kontakt-link" rel="nofollow">biuro@promoart.net.pl</a>
        </p>
      </div>
    </div>

    <div class="kontakt-card kontakt-card--phone flex items-center space-x-6 bg-gray-50 p-6 rounded-2xl border border-gray-200 transition">
      <div class="w-14 h-14 text-gray-900 rounded-xl flex items-center justify-center flex-shrink-0">
        <img src="{{ '/assets/img/telefon.png' | relative_url }}" alt="Telefon" class="w-8 h-8 object-contain">
      </div>
      <div>
        <p class="text-sm font-bold text-gray-400 uppercase tracking-wider">Telefon</p>
        <p class="text-xl font-bold text-gray-900"><a href="722079546" class="kontakt-link">722 079 546</a></p>
      </div>
    </div>

    <div class="kontakt-card kontakt-card--facebook flex items-center space-x-6 bg-gray-50 p-6 rounded-2xl border border-gray-200 transition">
      <div class="kontakt-icon kontakt-icon--facebook w-14 h-14 text-white rounded-xl flex items-center justify-center flex-shrink-0">
        <img src="{{ '/assets/img/fb.png' | relative_url }}" alt="Facebook" class="w-8 h-8 object-contain">
      </div>
      <div>
        <p class="text-sm font-bold text-gray-400 uppercase tracking-wider">Facebook</p>
        <p class="text-xl font-bold text-gray-900">
          <a href="https://www.facebook.com/p/PromoArt.Kielce.Reklamy/" target="_blank" rel="noopener noreferrer" class="kontakt-link">facebook.com/PromoArt.Kielce.Reklamy</a>
        </p>
      </div>
    </div>

    <div class="kontakt-card kontakt-card--instagram flex items-center space-x-6 bg-gray-50 p-6 rounded-2xl border border-gray-200 transition">
      <div class="w-14 h-14 rounded-xl flex items-center justify-center flex-shrink-0 text-red-600">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-8 h-8" fill="currentColor"><path d="M7.75 2h8.5A5.75 5.75 0 0 1 22 7.75v8.5A5.75 5.75 0 0 1 16.25 22h-8.5A5.75 5.75 0 0 1 2 16.25v-8.5A5.75 5.75 0 0 1 7.75 2zm0 1.5A4.25 4.25 0 0 0 3.5 7.75v8.5A4.25 4.25 0 0 0 7.75 20.5h8.5A4.25 4.25 0 0 0 20.5 16.25v-8.5A4.25 4.25 0 0 0 16.25 3.5h-8.5zm4.25 2.25a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 1.5a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7zm4.75-.75a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" /></svg>
      </div>
      <div>
        <p class="text-sm font-bold text-gray-400 uppercase tracking-wider">Instagram</p>
        <p class="text-xl font-bold text-gray-900">
          <a href="https://www.instagram.com/promoart_net_pl/" target="_blank" rel="noopener noreferrer" class="kontakt-link">@promoart_net_pl</a>
        </p>
      </div>
    </div>
  </div>
<br>
  <form id="contact-mail-form" class="mt-8 bg-gray-50 p-6 rounded-2xl border border-gray-200" style="display:none;" aria-label="Formularz wiadomosci email">
    <p class="text-sm font-bold text-gray-400 uppercase tracking-wider mb-3">Napisz do nas</p>
    <div class="space-y-4">
      <div>
        <label for="mail-subject" class="block text-sm font-semibold text-gray-700 mb-1">Temat</label>
        <input id="mail-subject" type="text" class="w-full rounded-lg border border-gray-300 px-3 py-2 text-base text-gray-900" placeholder="Np. Zapytanie o oferte">
      </div>
      <div>
        <label for="mail-message" class="block text-sm font-semibold text-gray-700 mb-1">Wiadomosc</label>
        <textarea id="mail-message" rows="5" class="w-full rounded-lg border border-gray-300 px-3 py-2 text-base text-gray-900" placeholder="Opisz, czego potrzebujesz"></textarea>
      </div>
      <button type="submit" class="inline-flex items-center rounded-lg text-white px-4 py-2 font-semibold transition" style="background:#dc2626;">Wyslij email</button>
    </div>
  </form>
</div>

<script>
  (function () {
    var emailLink = document.getElementById('contact-email-link');
    var mailForm = document.getElementById('contact-mail-form');
    var subjectInput = document.getElementById('mail-subject');
    var messageInput = document.getElementById('mail-message');
    var recipient = 'biuro@promoart.net.pl';

    if (!emailLink || !mailForm || !subjectInput || !messageInput) return;

    emailLink.addEventListener('click', function (event) {
      event.preventDefault();
      mailForm.style.display = 'block';
      subjectInput.focus();
      mailForm.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });

    mailForm.addEventListener('submit', function (event) {
      event.preventDefault();
      var subject = subjectInput.value.trim() || 'Zapytanie ze strony kontaktowej';
      var body = messageInput.value.trim();
      var mailto = 'mailto:' + recipient + '?subject=' + encodeURIComponent(subject) + '&body=' + encodeURIComponent(body);
      window.location.href = mailto;
    });
  })();
</script>

