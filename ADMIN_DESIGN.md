# Design System: Obsidian & Velvet

This document defines the official design system and visual guidelines for the **Nail Salon Admin Dashboard** (`projects/8930659476391607669`). The system balances the functional rigor of a back-office administration tool with the aesthetic elegance and sophistication of the beauty industry.

---

## Brand Personality & Style
* **Personality**: Sophisticated, Efficient, Artful.
* **Aesthetic**: Modern Corporate with a Minimalist touch.
* **Theme**: Dark Mode. Engineered to reduce eye strain during extended administrative use, utilizing tiered grayscale tones, slate-navy highlights, and silver-blue accents.

---

## Color Palette

### 1. Base & Surface Tones
Used for structural backgrounds, panels, sidebars, and cards.

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `background` / `surface` | `#131316` | Base application background (Level 0) |
| `surface-container-lowest`| `#0D0E10` | Darkest tone for deep background layouts |
| `surface-container-low` | `#1B1B1E` | Lower elevation container background |
| `surface-container` | `#1F1F22` | Standard container background / Cards (Level 1) |
| `surface-container-high` | `#292A2C` | Elevated container / Sidebar / Modals (Level 2) |
| `surface-container-highest`| `#343437` | Highly elevated elements / Popovers |

### 2. Core Brand Colors
Used for actions, highlights, primary text, and branding.

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `primary` | `#B8C6ED` | Slate-navy tint / Active text & subtle selection highlights |
| `primary-container` | `#3E4C6D` | Slate-navy / Primary action buttons, active navigation background |
| `secondary` | `#C6C6C7` | Neutral grey / Secondary buttons & borders |
| `tertiary` | `#BAC7E2` | Accent silver-blue / Inactive navigation icons, metadata labels |
| `tertiary-container` | `#404D64` | Muted slate accent |
| `outline` | `#8F9098` | Border color for high-contrast separation |
| `outline-variant` | `#45464E` | Subdued borders / Grid lines |

### 3. Typography & Text Colors

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `on-background` / `on-surface` | `#E4E2E5` | High-contrast off-white for primary text and icons |
| `on-surface-variant` | `#C5C6CF` | Muted graphite for secondary text, descriptions, and labels |
| `inverse-surface` | `#E4E2E5` | Light surface text |
| `inverse-on-surface` | `#303033` | Dark text on light backgrounds |

### 4. Semantic / Status Colors

| Token | Hex Value | Usage / Description |
| :--- | :--- | :--- |
| `error` | `#FFB4AB` | Error text / Alert status |
| `error-container` | `#93000A` | Error container background |
| `on-error` | `#690005` | High-contrast text on error container |
| `on-error-container` | `#FFDAD6` | Soft error accent text |

---

## Typography

The typography uses the clean, sharp, and contemporary sans-serif **Hanken Grotesk** to convey precision and modernity.

* **Primary Font Family**: `Hanken Grotesk`, sans-serif
* **Headline Font Family**: `Hanken Grotesk`, sans-serif
* **Label Font Family**: `Hanken Grotesk`, sans-serif

### Typography Scale

| Style / Token | Font Size | Font Weight | Line Height | Letter Spacing | Usage |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `headline-lg` | `32px` | Semibold (`600`) | `40px` | `-0.02em` | Main dashboard header, total figures |
| `headline-md` | `24px` | Semibold (`600`) | `32px` | `0` | Section titles, card headers |
| `title-sm` | `16px` | Semibold (`600`) | `24px` | `0` | Subsection headers, table headers |
| `body-md` | `14px` | Regular (`400`) | `20px` | `0` | Standard body text, table cells, form fields |
| `label-md` | `12px` | Medium (`500`) | `16px` | `0.05em` | Metadata tags, category headers (uppercase) |

---

## Layout, Spacing & Roundness

### Spacing Scale
Built on a **4px base unit** to ensure a high-density, precise tool layout.

* **Base**: `4px`
* **Gutter**: `16px`
* **Margin (Mobile)**: `16px`
* **Margin (Desktop)**: `24px`
* **Sidebar Width**: `260px` (Fixed navigation)

### Border Radius (Roundness)
Introduces organic styling details ("feminine touch") to soften the industrial dashboard feel.

* `sm` (`0.125rem` / `2px`): Small buttons, checkboxes
* `DEFAULT` (`0.25rem` / `4px`): Input fields, primary buttons, small cards
* `md` (`0.375rem` / `6px`): Context menus, tooltips
* `lg` (`0.5rem` / `8px`): Main cards, sidebar highlights
* `xl` (`0.75rem` / `12px`): Modal containers
* `full` (`9999px`): Status badges, chips

---

## Elevation & Depth (Visual Layering)
In this dark UI theme, depth is established using **Tonal Layers** rather than drop shadows:

1. **Level 0 (Base)**: `#131316` – Application canvas.
2. **Level 1 (Sidebar/Containers)**: `#1F1F22` – Visual segregation from base canvas.
3. **Level 2 (Cards/Modals/Overlays)**: `#292A2C` or `#343437` – Border of `#3E4C6D` (slate-navy) at `20%` opacity to define boundaries without adding visual weight.

---

## Component Guidelines

### Buttons & Actions
* **Primary Button**: Solid fill of `#3E4C6D` (primary-container) with `#FFFFFF` text. Uses `8px` (`lg`) border radius for touch targets.
* **Secondary/Ghost Button**: Outline border of `#8F9098` or `#45464E`, background transparent, text `#E4E2E5`.

### Inputs & Forms
* **Input Field**: Background of `#1B1B1E` or `#131316` with a `1px` border of `#45464E` (`outline-variant`).
* **Active/Focus State**: Border transitions to `#3E4C6D` (slate-navy) on focus.

### Navigation / Sidebar
* **Active Navigation Item**: Background highlighted in `#3E4C6D` with a soft `8px` rounded-rect radius and `#FFFFFF` text.
* **Inactive Navigation Item**: Text and icon colored in `#BAC7E2` or `#8F9098` with transparent background.

### Cards & Tables
* **Cards**: Wrapper background `#1F1F22`. Standard `8px` border radius (`lg`). Uses contrast against `#131316` base; no drop shadows.
* **Table Rows**: Thin borders using `#45464E` (`outline-variant`). Alternate row zebra-striping with `#1B1B1E`.
