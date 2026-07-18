# Customer-Facing Design System: Serene Petal

This document defines the official design system and visual guidelines for the **DIFNails Aesthetic Salon Website** (`projects/90967343007712046`). This system is designed around the principles of "Quiet Luxury" and "Modern Femininity" to evoke calm, relaxation, and premium indulgence for clients browsing and booking salon services.

---

## Brand Personality & Style
* **Personality**: Quiet Luxury, Indulgent, Artful, Welcoming.
* **Aesthetic**: Aesthetic Minimalism—prioritizing high-quality imagery, generous negative space, and a soft, rhythmic flow between layout sections.
* **Theme**: Light Mode. Focuses on skin-toned and soft textile-inspired palettes to make customer experiences feel reassuring and premium.

---

## Color Palette

### 1. Base & Surface Tones
Mimics soft warm textiles, creams, and pearls to serve as a warm alternative to stark white.

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `background` / `surface` | `#FFF8F7` | Foundational page canvas background |
| `surface-bright` | `#FFF8F7` | High-brightness canvas overlay |
| `surface-container-lowest`| `#FFFFFF` | Pure white for high-contrast content cards |
| `surface-container-low` | `#FFF0F0` | Very pale pink wash for section backing |
| `surface-container` | `#FCEAE9` | Standard component backing / Soft pink |
| `surface-container-high` | `#F6E4E4` | Slightly darker pink tint for container elevation |
| `surface-container-highest`| `#F0DFDE` | Darkest container wash for layered sections |
| `surface-dim` | `#E7D6D6` | Muted blush-grey for inactive surface layers |

### 2. Core Brand Colors
Used for brand highlights, action points, and interactive outline states.

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `primary` | `#71585B` | Deep Rose-Gold / Brand anchors, key titles, and focus states |
| `primary-container` | `#F8D7DA` | Soft Pastel Pink / Secondary buttons, active badge highlights |
| `secondary` | `#5F5F59` | Muted Olive-Grey / Neutral indicators and helper boundaries |
| `secondary-container` | `#E4E3DB` | Pale Cream-Olive / Supporting backdrop washes |
| `tertiary` | `#825249` | Muted Terracotta (Rose Gold) / Primary call-to-actions, booking actions |
| `tertiary-container` | `#FFD6CF` | Pale Salmon / Supporting highlight backgrounds |
| `outline` | `#817475` | Outline boundaries and subtle separation borders |
| `outline-variant` | `#D2C3C4` | Ghost borders / Ultra-thin 1px accents |

### 3. Typography & Text Colors

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `on-background` / `on-surface` | `#221919` | Warm Charcoal / Standard text color, avoiding harshness of solid black |
| `on-surface-variant` | `#4F4445` | Muted Charcoal / Secondary descriptions, captions, and body labels |

### 4. Semantic / Status Colors

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `error` | `#BA1A1A` | Coral-red / Error alerts and warnings |
| `error-container` | `#FFDAD6` | Pale red background for alerts |
| `on-error` | `#FFFFFF` | High-contrast text on error container |
| `on-error-container` | `#93000A` | Text accent for error warnings |

---

## Typography

The typography system uses a high-contrast pairings: an editorial serif headline style combined with a highly legible sans-serif for UI labels and copy.

* **Headline Font Family**: `Bodoni Moda`, serif (fashion-forward, elegant, editorial)
* **Body & UI Font Family**: `DM Sans`, sans-serif (clean, modern, highly legible)

### Typography Scale

| Style / Token | Font Family | Font Size | Font Weight | Line Height | Letter Spacing | Usage |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `display-lg` | `Bodoni Moda` | `48px` | Semibold (`600`) | `1.1` | `-0.02em` | Main hero display, brand title |
| `headline-lg` | `Bodoni Moda` | `32px` | Medium (`500`) | `1.2` | `0` | Primary section headers (Desktop) |
| `headline-lg-mobile`| `Bodoni Moda` | `28px` | Medium (`500`) | `1.2` | `0` | Primary section headers (Mobile) |
| `headline-md` | `Bodoni Moda` | `24px` | Medium (`500`) | `1.3` | `0` | Card titles, service category headers |
| `body-lg` | `DM Sans` | `18px` | Regular (`400`) | `1.6` | `0` | Intro text, prominent content copy |
| `body-md` | `DM Sans` | `16px` | Regular (`400`) | `1.6` | `0` | Standard body text, description text |
| `label-md` | `DM Sans` | `14px` | Medium (`500`) | `1.4` | `0.05em` | Buttons, chips, navigation tabs (uppercase) |
| `label-sm` | `DM Sans` | `12px` | Medium (`500`) | `1.4` | `0.03em` | In-card tags, small metadata labels |

---

## Layout, Spacing & Roundness

### Spacing Scale
Built on an **8px base unit** to support fluid layouts and elegant vertical "breathing room."

* **Base Grid Unit**: `8px`
* **Grid Gutter**: `16px`
* **Grid Margin (Mobile)**: `24px`
* **Section Gap (Mobile)**: `64px`
* **Section Gap (Desktop)**: `120px` (Airy layout spacing)

### Border Radius (Shapes)
Curved accents echo the organic silhouettes of well-manicured nails.

* `sm` (`0.25rem` / `4px`): Tiny buttons, small badges
* `DEFAULT` (`0.5rem` / `8px`): Standard buttons, input fields, service list items
* `md` (`0.75rem` / `12px`): Sub-sections, calendar popups
* `lg` (`1rem` / `16px`): Primary booking cards
* `xl` (`1.5rem` / `24px`): Large image frames, prominent content containers
* `full` (`9999px`): Pill-shaped chips (e.g. Service Category Badges)

---

## Elevation & Depth (Visual Layering)
This system relies on soft tonal layers and borders instead of drop shadows:

* **Tonal Layers**: Shifts between Cream (`#FFF8F7`) and very pale Pink (`#FFF0F0`) define section blocks.
* **Ghost Borders**: Ultra-thin `1px` lines in a slightly darker pink (`#D2C3C4`) or rose gold define interactive boundaries.
* **Shadows**: When necessary for hovered cards, use a very diffused, low-opacity shadow tinted with terracotta:
  `box-shadow: 0 8px 30px rgba(181, 126, 116, 0.12);`

---

## Component Guidelines

### Buttons
* **Primary Button**: Solid fill of `#825249` (tertiary terracotta) with white text. 200ms transitions on hover.
* **Secondary Button**: Outlined in `#71585B` or `#F8D7DA` with matching pink text.

### Input Fields
* **Stationery Input**: Cream background with a bottom-only border in Rose Gold (`#825249`) for an elegant writing-pad aesthetic.
* **Standard Input**: Cream background with full soft-pink border (`#F8D7DA`).

### Cards & Service Items
* **Structure**: Enclosed in a thin primary-colored border instead of a shadow.
* **Images**: Image elements inside cards should always feature a top-only border-radius of `24px` (`xl`).

### Booking Calendar
* **Style**: Minimalist styling with a base outline.
* **Selections**: Selected dates use `#F8D7DA` (Primary Pink) background; today's date indicator uses `#825249` (Tertiary).
