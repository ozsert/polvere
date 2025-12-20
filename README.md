# Script Management Folder

## Overview

This folder contains template files that are injected into the Polvere website pages through the website platform's script management system. These files allow for centralized management of global scripts, styles, and components that appear across multiple pages.

## Purpose

The script management system enables:
- **Centralized Updates**: Modify features once and have them apply across all pages
- **Easy Maintenance**: Keep promotional content, tracking codes, and UI elements in one place
- **Non-Technical Management**: Update content without directly editing the main HTML files
- **Platform Integration**: Work seamlessly with the website builder's deployment system

---

## Files

### 1. `TumSayfalarHeader.html`
**Injected into:** Page header (top of pages)

**Contains:**

#### Meta Tags & Verification
- Google Site Verification
- Facebook Domain Verification
- Yandex Verification

#### Tracking & Analytics
- Google Tag Manager (GTM-NT99J2J)
- Google Tag Manager noscript fallback

#### Promotional Banner (Bottom of Page)
- **Black transparent scrolling banner** with promotional messages
- Displays: "TÜM ÜRÜNLERDE %50'YE VARAN İNDİRİMLER!" alternating with elegant brand messages
- **Features:**
  - Infinite horizontal scroll animation (left to right)
  - Language detection (Turkish/English)
  - Pause on hover functionality
  - Responsive design (different animation for mobile)
  - Links to `/hemen-teslim` page
- **Styling:**
  - Black semi-transparent background (`rgba(0, 0, 0, 0.5)`)
  - Frosted glass blur effect
  - White text with Ubuntu font
  - Red dot separators
  - Fixed position at bottom of viewport

**Messages:**
1. TÜM ÜRÜNLERDE %50'YE VARAN İNDİRİMLER!
2. Polvere dünyasına adım atarken şıklığı hissedin.
3. Zarafeti ve özgünlüğü bir arada yaşayın.
4. Her anınıza değer katan tasarımlar.
5. Stilinizi Polvere ile tamamlayın.
6. Kendinizi özel hissettiren koleksiyonlar.
7. Zamansız zarafet, modern dokunuşlar.
8. Günlük şıklığın yeni adresi.
9. Özel tasarımlarla fark yaratın.

---

### 2. `TumSayfalar.html`
**Injected into:** All pages (body content)

**Contains:**

#### Tracking & Analytics
- Google Tag Manager (GTM-MNDRJ2HV)

#### Font Loading
- Google Fonts: Montserrat (400, 500, 600, 700 weights)
- Optimized async loading

#### Social Media Buttons

**WhatsApp Button:**
- Fixed position (bottom: 150px, left: 15px)
- Links to: `+905449757177`
- Green background (`#25d366`)
- Pulse animation effect
- Responsive styling

**Instagram Button:**
- Fixed position (bottom: 220px, left: 15px)
- Links to: `@polveredress`
- Instagram pink background (`#E1306C`)
- Pulse animation effect
- Responsive styling

#### Product Discount System

**Basket Discount Calculator:**
- Automatically calculates 20% discount for special product categories
- **Categories:**
  - `ozelAlan1`: Products with "KÜRKLERDE SEPETTE %20 İNDİRİM" tag
  - `ozelAlan3`: Products with "HEMEN TESLİM TASARIM ELBİSELER" tag

**Features:**
- Real-time price calculation
- Multi-currency support (TRY and others)
- Dynamic badge display on product cards
- MutationObserver for dynamic content updates
- Red badges with discount information

**Visual Styling:**
- Red discount badges on product listings
- Price display in cart format
- Responsive badge positioning

#### Category Highlighting
- Highlights special categories in red
- Automatically adds classes to matching elements

---

## How It Works

### Deployment Flow

```
/
  ├── TumSayfalarHeader.html  →  Injected into <head> or top of pages
  └── TumSayfalar.html         →  Injected into <body> across all pages
                                      ↓
                                Website Builder
                                      ↓
                                Final HTML Pages
                                 (e.g., a.html)
```

### When Changes Take Effect

1. **Edit** files in `/` folder
2. **Save** changes
3. Website platform automatically **injects** updated code
4. Changes appear on **live site** after deployment/rebuild

---

## Common Tasks

### Update Promotional Banner Text
**File:** `TumSayfalarHeader.html`
**Lines:** 114-145
Edit the `kayanYazi.innerHTML` content to change scrolling messages.

### Change Banner Background Color
**File:** `TumSayfalarHeader.html`
**Search for:** `background-color: rgba(0, 0, 0, 0.5)`
Modify RGBA values to change color and transparency.

### Update Discount Percentages
**File:** `TumSayfalar.html`
**Lines:** 144-150
Change `IndirimOrani1` and `IndirimOrani3` values (0.80 = 20% discount).

### Modify Social Media Links
**File:** `TumSayfalar.html`
- **WhatsApp:** Line 27 - `href="https://wa.me/905449757177"`
- **Instagram:** Line 76 - `href="https://www.instagram.com/polveredress/"`

### Update Google Tag Manager
**File:** Both files
Search for `GTM-` and replace with new GTM ID.

---

## Technical Details

### Dependencies
- jQuery (for discount calculator)
- Google Fonts API
- Font Awesome (for social icons)
- Modern browser with ES6 support

### Browser Support
- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

### Performance Optimizations
- Async font loading
- CSS animations (GPU accelerated)
- MutationObserver for efficient DOM monitoring
- Optimized script loading with `fncOptimizeScript`

---

## Best Practices

### Editing Guidelines

1. **Always test changes** before deploying to production
2. **Maintain backup** copies before major edits
3. **Use consistent formatting** for readability
4. **Document changes** in comments when making significant updates
5. **Keep promotional messages** consistent with brand voice

### Code Organization

- CSS: Inline `<style>` blocks for each component
- JavaScript: Inline `<script>` blocks with clear separation
- Comments: Turkish comments for local team reference

### Maintenance Schedule

**Regular Reviews:**
- ✅ Monthly: Check discount percentages and promotional text
- ✅ Quarterly: Verify tracking codes and analytics
- ✅ Seasonally: Update promotional banners for campaigns
- ✅ Annually: Review and clean unused code

---

## Troubleshooting

### Banner Not Showing
- Check if `kayan-yazi` element exists in DOM
- Verify JavaScript loads after DOM ready
- Check z-index conflicts with other elements

### Discounts Not Calculating
- Ensure jQuery is loaded before script
- Verify product has correct special field tags
- Check browser console for JavaScript errors

### Social Buttons Not Appearing
- Verify Font Awesome is loaded
- Check fixed positioning and z-index
- Test on different screen sizes

### Tracking Not Working
- Confirm GTM IDs are correct
- Check browser privacy settings/ad blockers
- Verify GTM container is published

---

## Contact & Support

For questions about these scripts or to request changes:
- Review this documentation first
- Test changes in a development environment
- Contact the development team for assistance

---

**Last Updated:** 2025-12-19
**Maintained By:** Polvere Development Team
