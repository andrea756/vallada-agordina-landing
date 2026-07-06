# Qualamano — Brand Guidelines Landing Page

Documento di riferimento per replicare lo stile della landing **Vallada Agordina** su nuove pagine di servizio Qualamano. Copia-incolla i token e i pattern qui sotto.

---

## 1. Colori

```css
:root{
  /* Brand */
  --primary:      #7F54F1;   /* Viola Qualamano principale (CTA, accenti, hover) */
  --primary-dark: #6249B1;   /* Hover stati attivi, gradient form, button pressed */
  --primary-light:#8F65FF;   /* Hover footer, link footer scuro */
  --primary-soft: #F3EEFE;   /* BG eyebrow tags, hover tiles, sezione "Lotti" alternata */

  /* Testo & superfici */
  --text:  #231F20;          /* Testo principale */
  --muted: #6b6b6b;          /* Testo secondario, paragrafi descrittivi */
  --grey:  #ECECEC;          /* Placeholder immagini, separatori secondari */
  --bg:    #ffffff;          /* Background pagina */
  --bg-alt:#FAFAFB;          /* Background sezioni alternate (Lotti) */
  --border:#ECECEC;          /* Bordi cards, divisori, input */

  /* Ombre */
  --shadow:   0 6px 20px rgba(98,73,177,.08);   /* Card normali */
  --shadow-lg:0 20px 50px rgba(98,73,177,.18);  /* Hero video, immagini principali */
}

/* Footer */
background: #E8E6E4;  /* Grigio caldo light */
testo: #3a3a3a;
labels: #1c1c1c;
links policy: #3b2e6b;
```

**Regola d'uso**:
- Viola `--primary` solo per CTA principali, badge, eyebrow tags, link
- `--primary-soft` per fondi morbidi (hover, sezioni alternate)
- Mai usare il viola come testo lungo — solo su elementi corti (label, prezzo, CTA)

---

## 2. Tipografia

```html
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&family=Asap:wght@400;500;600&display=swap" rel="stylesheet">
```

| Famiglia | Uso | Pesi |
|---|---|---|
| **Poppins** | Titoli (h1-h4), CTA, label, badge, prezzi, numeri stat | 400, 500, 600, 700, 800 |
| **Asap** | Body, paragrafi descrittivi, contenuto lungo | 400, 500, 600 |

### Scala
```css
h1 { font-size: clamp(1.9rem, 3.6vw, 2.8rem); font-weight: 700; line-height: 1.15; letter-spacing: -.01em; }
h2 { font-size: clamp(1.5rem, 2.8vw, 2rem); font-weight: 700; line-height: 1.15; }
h3 { font-size: 1.2rem; font-weight: 600; }
body { font-family: 'Asap', sans-serif; line-height: 1.55; color: var(--text); }
p { color: var(--muted); }
```

### Eyebrow (occhielli pre-titolo)
```html
<span class="eyebrow">Etichetta sezione</span>
```
```css
.eyebrow {
  display: inline-block;
  background: var(--primary-soft);
  color: var(--primary);
  padding: 5px 14px;
  border-radius: 50px;
  font-family: 'Poppins', sans-serif;
  font-size: .74rem;
  letter-spacing: 1px;
  font-weight: 600;
  margin-bottom: 14px;
  text-transform: uppercase;
}
```

---

## 3. Logo

**File ufficiale**: `logo-qualamano.svg` (81×14, wordmark con icona viola + testo)

**Versioni**:
- **Header / sezione chiara** → SVG così com'è, `height: 30px`
- **Footer / sfondo scuro** → `filter: brightness(0) invert(1)` per renderlo bianco
- **Sezione "Chi siamo"** → file dedicato `Logo sezione chi siamo.png` (versione grande con claim "Vendi bene, acquisti meglio")

**Mai**:
- Aggiungere testo ".com" o claim accanto al SVG (è già completo)
- Usare il logo su sfondo viola pieno (basso contrasto)
- Distorcerlo o cambiarne i colori

---

## 4. Layout & Container

```css
.container { max-width: 1180px; margin: 0 auto; padding: 0 24px; }
section { padding: 80px 0; }     /* Desktop */
section { padding: 50px 0; }     /* Mobile <900px */
```

### Breakpoints
- **Desktop**: `>900px` → layout multi-colonna pieno
- **Tablet/mobile**: `<900px` → tutte le grid in singola colonna, nav hamburger, sticky CTA mobile attiva
- **Extra small**: `<500px` → padding ridotto, font compressi, lightbox/lot CTA full width

### Bottoni standard
```css
.btn { padding: 13px 26px; border-radius: 50px; font: 600 .92rem 'Poppins'; }
.btn-primary { background: var(--primary); color: #fff; }
.btn-primary:hover { background: var(--primary-dark); transform: translateY(-1px); box-shadow: 0 10px 24px rgba(127,84,241,.3); }
.btn-ghost { background: transparent; border: 1.5px solid var(--border); color: var(--text); }
.btn-ghost:hover { border-color: var(--primary); color: var(--primary); }
```

---

## 5. Componenti Chiave

### 5.1 Header sticky con nav
```html
<header class="site">
  <div class="nav">
    <a href="#" class="logo"><img src="logo-qualamano.svg"></a>
    <nav class="nav-links">
      <a href="#intro">Intro</a>
      <a href="#sezione">Sezione</a>
      ...
    </nav>
    <div class="nav-right">
      <a href="tel:..." class="nav-phone">📞 0422 693028</a>
      <a href="#contatti" class="nav-cta">Richiedi informazioni</a>
    </div>
  </div>
</header>
```
- `position: sticky; top: 0; z-index: 50; background: #fff; border-bottom: 1px solid var(--border);`
- Su mobile: nav-links + nav-phone nascosti, hamburger + drawer mobile

### 5.2 Hero
**Pattern**:
- Sfondo bianco, forma diagonale viola in alto a dx (`clip-path` triangolo)
- Eyebrow centrato
- H1 grande con accento (em) viola, possibile `<br>` per andare a capo
- Sottotitolo location/info
- Video full-width autoplay muted loop con poster + bottone "Attiva audio" in basso a dx
- Lot bar sotto: intro stretta sinistra + tile prodotti + CTA destra

```css
.hero { padding: 50px 0 70px; background: #fff; position: relative; overflow: hidden; }
.hero::before {
  content: ""; position: absolute; top: -100px; right: -100px;
  width: 520px; height: 520px; background: var(--primary); opacity: .95;
  clip-path: polygon(100% 0, 100% 100%, 0 0);
}
.hero-video {
  position: relative; border-radius: 18px; overflow: hidden;
  background: #000; padding-bottom: 56.25%; height: 0;
  box-shadow: var(--shadow-lg);
}
```

### 5.3 Card componente con sticky aside (sezione prodotto)
Struttura: gallery 5 foto a sx + sticky details card a dx con tag, nome, prezzo viola, features grid, descrizione, CTA primary+ghost.

```css
.lot-details {
  background: #fff; border: 1px solid var(--border); border-radius: 16px;
  padding: 28px; box-shadow: var(--shadow);
  position: sticky; top: 90px;  /* sticky sotto header */
}
.price-block {
  background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
  color: #fff; border-radius: 12px; padding: 16px 20px;
}
```

### 5.4 Carosello (planimetrie / immagini singole)
- Una immagine visibile, frecce ‹ › laterali cerchiate
- Counter "X / N" alto-destra in pill viola/grigio
- Dots in basso, attivo viola allungato
- Loop circolare (next dall'ultima → prima)
- Click immagine → apre in lightbox fullscreen

### 5.5 Lightbox / galleria fullscreen
- Background `rgba(15,10,30,.94)`, blur backdrop
- Immagine `max-width: 90vw; max-height: 84vh`
- Bottoni glass (rgba bianco + border 1.5px + backdrop-blur)
- Counter tag in pill alto-sx, thumbnails round 48px in basso, attivo viola
- Click immagine → toggle zoom (scale 1.6)
- Navigazione: tastiera ESC/←/→, click esterno chiude

### 5.6 Sezione "Chi siamo"
2 colonne: logo grande PNG dedicato a sx + eyebrow + h2 + copy a dx.

### 5.7 Sezione form (CTA finale)
- Sfondo `linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%)`
- Colonna sinistra: eyebrow bianco semitrasparente + h2 bianco + lista perks con check viola/bianco
- Colonna destra: iframe Zoho **senza wrapper bianco** (`.form-card-zoho { background: transparent !important; padding: 0 !important; box-shadow: none !important; }`)

### 5.8 Footer light
- Sfondo `#E8E6E4` (grigio caldo)
- 3 colonne `1.1fr 1.4fr 1fr`:
  - Col 1: logo grande + dati azienda (P.Iva, REA, Email, Pec) + ® claim
  - Col 2: link accordion con divider sopra/sotto e freccia › che si sposta su hover
  - Col 3: "Seguici su" + 3 social cerchi vuoti + policy links viola scuro
- **NO** copyright bar, **NO** scure CTA

### 5.9 Mobile sticky CTA bar
Bar fissa in basso con 2 CTA: "Chiama" (ghost) + "Richiedi info" (primary). Solo su `<900px`. Body ha `padding-bottom: 78px` per non coprire contenuto.

---

## 6. Pattern Sezioni (struttura "scheletro" landing)

Ordine consigliato per una landing prodotto/servizio Qualamano:

1. **Header sticky** (nav + CTA)
2. **Hero** (eyebrow + h1 + sub + video + lot/service bar)
3. **Intro "Il Progetto"** (2 col: copy + immagine con stats glass overlaid)
4. **Sezione prodotto/servizio** (header con tag/nome/prezzo pill + content 2 col: gallery + sticky details + planimetria carousel sotto)
5. **(Ripetere per ogni unità/variante)**
6. **Mappa** (1.5fr | 1fr: iframe Google Maps + info card con indirizzo, distanze)
7. **Chi siamo** (logo PNG | copy)
8. **Form section** (gradient viola: copy perks | iframe Zoho)
9. **Footer light** (3 col)
10. **Sticky mobile bar**

---

## 7. Immagini

- **Esterni & dettagli**: foto reali del prodotto, dimensioni ottimizzate per il web (massimo ~300KB ciascuna)
- **Drone shots**: per hero video poster o intro image
- **Planimetrie**: PNG/JPG, sfondo `#fafafa` border `1px solid var(--border)`, mostrate una alla volta in carosello
- **Naming**: cartelle separate per ogni "unità/variante" prodotto (es. `Lotto 1/`, `Lotto 2/`), niente mix tra le gallerie

---

## 8. Video Hero

**Pattern self-hosted** (no YouTube, evita anti-bot):
```html
<video id="heroVideo" autoplay muted loop playsinline preload="auto"
       poster="poster.jpg">
  <source src="video.mp4" type="video/mp4">
</video>
<button type="button" class="video-sound" id="videoSoundToggle">
  <span class="vs-muted"><svg>...</svg> Attiva audio</span>
  <span class="vs-on"><svg>...</svg> Audio attivo</span>
</button>
```
JS: click → toggle `muted`, classe `unmuted` sul button.

Bottone audio: pill glass `rgba(0,0,0,.55)` + blur, in basso a destra del video.

---

## 9. Integrazioni Standard (da copiare in ogni landing)

### Cookiebot (PRIMISSIMO script in `<head>`)
```html
<script id="Cookiebot"
  src="https://consent.cookiebot.com/uc.js"
  data-cbid="f954f450-c1fd-4162-b5a0-8c9e80587b4f"
  data-blockingmode="auto"
  type="text/javascript"></script>
```

### GTM (subito dopo Cookiebot in `<head>`)
```html
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MV25VBDP');</script>
```
+ noscript fallback inizio `<body>`.

### Form Zoho
- Generare embed dal dashboard Zoho del nuovo form
- Incollare lo script `(function(){...})()` di Zoho dentro un wrapper trasparente
- Forzare `width: 100% !important` sull'iframe via CSS
- Aggiungere il listener submit per `dataLayer.push({event:'submit_contact_form', form_name:'NOME_LANDING'})`
- Aggiungere UTM populator (legge URL params e li accoda all'iframe src via MutationObserver)

### Tracking submit Zoho (template)
```js
(function () {
  var FORM_PERMA  = 'XXXX_PERMA_FORM_NEW';
  var ZOHO_ORIGIN = 'https://forms.zohopublic.eu';
  var tracked = false;
  window.addEventListener('message', function (event) {
    if (event.origin !== ZOHO_ORIGIN) return;
    var data = event.data;
    if (typeof data !== 'string') return;
    var parts = data.split('|');
    if (parts.length !== 3) return;
    if (parts[0].indexOf(FORM_PERMA) === -1) return;
    if (tracked) return;
    tracked = true;
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({ event: 'submit_contact_form', form_name: 'NOME_NUOVA_LANDING' });
  }, false);
})();
```

---

## 10. Deployment

**Stack**: HTML statico singolo file → GitHub → Vercel

**Workflow**:
```bash
git add .
git commit -m "Descrizione modifica"
git push
# Vercel rebuilda automaticamente in 10-15 secondi
```

**Per il dominio**:
1. Chiedi al tecnico DNS di puntare il sottodominio `<nome>.qualamano.com` via CNAME a Vercel
2. Su Vercel: aggiungere il dominio al progetto + `vercel certs issue <nome>.qualamano.com`
3. SSL Let's Encrypt rilasciato in 1-2 minuti, rinnovo automatico

---

## 11. Tono di voce / copy

- **Linguaggio**: italiano professionale ma caldo, no inglese se non necessario
- **CTA tipiche**: "Richiedi informazioni", "Prenota una visita", "Contatta l'agente"
- **Eyebrow**: corte, maiuscolo letter-spaced (es. "IL PROGETTO", "CHI SIAMO", "GALLERIA")
- **Titoli h2**: brevi e dichiarativi ("Anima alpina. Comfort contemporaneo.")
- **Footer claim**: "Vendi bene, acquisti meglio"
- Mai vendita aggressiva, sempre invito alla scoperta

---

## 12. Quick checklist nuova landing

- [ ] Copia `index.html` come base
- [ ] Cambia `<title>`, `<meta description>`, `<h1>`, copy hero
- [ ] Sostituisci video MP4 + poster
- [ ] Aggiorna sezioni prodotto/servizio con nuovi contenuti
- [ ] Sostituisci foto in nuove cartelle (`/Prodotto 1/`, `/Prodotto 2/`)
- [ ] Aggiorna mappa Google con nuovo indirizzo
- [ ] Cambia FORM_PERMA Zoho con quello nuovo + UTM Field Map (quando Matteo conferma i field name)
- [ ] Cambia `form_name` nel dataLayer push
- [ ] Aggiorna footer (dati azienda restano uguali)
- [ ] Test mobile a 360/375/768/1400px (zero overflow orizzontale)
- [ ] Verifica DNS sottodominio + SSL Vercel
- [ ] Test con `?utm_source=test&utm_medium=email` per validare tracking

---

## 13. Risorse

- **Repo template di riferimento**: https://github.com/andrea756/vallada-agordina-landing
- **Live esempio**: https://vallada-agordina.qualamano.com
- **GTM ID**: `GTM-MV25VBDP` (stesso per tutte le landing Qualamano)
- **Cookiebot CBID**: `f954f450-c1fd-4162-b5a0-8c9e80587b4f`
- **Zoho team**: `aste33`, dominio EU (`forms.zohopublic.eu`)
- **Logo SVG**: salvato come `logo-qualamano.svg` nella root della landing
