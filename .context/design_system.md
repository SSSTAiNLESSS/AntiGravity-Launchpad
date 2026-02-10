# Design System

> Visual design grounding layer. Agents reference this when building UI to ensure consistency.
> Populate this from your design tool (Figma, Stitch, etc.) or define manually.

## Color Palette

| Token | Value | Usage |
|-------|-------|-------|
| `--color-primary` | _#3B82F6_ | Buttons, links, active states |
| `--color-secondary` | _#10B981_ | Success, confirmations |
| `--color-accent` | _#F59E0B_ | Warnings, highlights |
| `--color-background` | _#0F172A_ | Page background |
| `--color-surface` | _#1E293B_ | Cards, modals |
| `--color-text` | _#F8FAFC_ | Primary text |
| `--color-text-muted` | _#94A3B8_ | Secondary text |

## Typography

| Role | Font | Weight | Size |
|------|------|--------|------|
| Headings | _Inter_ | 700 | 2rem–3rem |
| Body | _Inter_ | 400 | 1rem |
| Code | _JetBrains Mono_ | 400 | 0.875rem |
| Captions | _Inter_ | 400 | 0.75rem |

## Layout Principles
- **Max width**: 1280px centered
- **Grid**: 12-column with 1.5rem gap
- **Spacing scale**: 4px base (0.25rem increments)
- **Border radius**: 0.5rem (cards), 0.375rem (buttons), 9999px (pills)
- **Breakpoints**: `sm` 640px, `md` 768px, `lg` 1024px, `xl` 1280px

## Component Styles

### Buttons
- Primary: `bg-primary text-white rounded-md px-4 py-2 font-medium`
- Secondary: `border border-primary text-primary rounded-md px-4 py-2`
- Ghost: `text-text-muted hover:text-text px-4 py-2`

### Cards
- `bg-surface rounded-lg p-6 border border-white/10`

### Theme
- _[dark / light / system]_ — Default: **dark**

---

> **Auto-extraction**: If using Google Stitch, run the `design-md` skill to populate this file automatically from your Stitch project.
> If using Figma, export design tokens via the Figma Tokens plugin and paste here.
