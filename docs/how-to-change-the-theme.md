# How to Change the Theme

## Colors

Edit `src/styles/global.css`. The key variables at the top of `:root`:

```css
--accent: #2337ff;       /* links, active nav underline, blockquote border */
--accent-dark: #000d8a;  /* currently unused, available for hover states   */
```

Dark mode color overrides live in the `[data-theme="dark"]` block in the same file.

## Dark mode behavior

The toggle button in the header cycles between light and dark. The system preference (`prefers-color-scheme`) is used as the default on first visit. User choice is stored in `localStorage`.

To change dark mode colors, edit the `[data-theme="dark"]` block in `global.css`.

## Font

The blog uses Atkinson Hyperlegible, stored locally in `src/assets/fonts/`. To swap fonts:

1. Add your font files to `src/assets/fonts/`
2. Update the `fonts` array in `astro.config.mjs`:

```js
{
  provider: fontProviders.local(),
  name: 'YourFont',
  cssVariable: '--font-yourfont',
  options: {
    variants: [{ src: ['./src/assets/fonts/yourfont.woff'], weight: 400, style: 'normal', display: 'swap' }]
  }
}
```

3. Update `src/components/BaseHead.astro` — change `cssVariable="--font-atkinson"` to `cssVariable="--font-yourfont"`
4. Update `body { font-family: var(--font-yourfont); }` in `global.css`

## Layout width

Default content width is 720px. Change in `global.css`:

```css
main { width: 720px; }
```

## Accent color in dark mode

The accent color `#2337ff` is slightly low-contrast on dark backgrounds. If you change the accent, also add a dark-mode override in `[data-theme="dark"]`:

```css
[data-theme="dark"] {
  --accent: #6b7fff;
}
```
