# Marcello Avila — Blog

Personal blog built with [Astro](https://astro.build/). Deployed on Vercel.

**Live:** https://blog.marcelloavila.com/

## Stack

- Astro 5 + TypeScript
- Content Collections for type-safe post management
- Local fonts (Atkinson Hyperlegible)
- Google Analytics GA4 (production only)
- Vercel deployment with security headers

## Setup

```sh
npm install
npm run dev       # localhost:4321
npm run build     # outputs to dist/
npm run preview   # preview the build locally
```

## Deployment

Deployed on Vercel. Pushes to `main` auto-deploy. Build config is in `vercel.json` — security headers (CSP, X-Frame-Options, etc.) are configured there.

No environment variables required for basic operation.

## Recipes

- [How to add a post](docs/how-to-add-a-post.md)
- [How to change the theme](docs/how-to-change-the-theme.md)

## Customization

- [ ] Accent color — `--accent: #2337ff` in `src/styles/global.css`
- [ ] Default OG image — fallback in `src/components/BaseHead.astro`
- [ ] Paywall spec — see [`docs/spec-paywall.md`](docs/spec-paywall.md)

## Post Ideas

- [ ] Add bash aliases post
- [ ] Setup and blog about GPG
- [ ] Blog: HTTPS certs behavior
- [ ] Blog: Ethical hacking: weaker chain link
- [ ] Blog: Password rule of 3, 2, 1
- [ ] Add post on image deletion idea ("quit" project, mobile app)
- [ ] Edit home page with personal ideas and values

## References to Research

- [sneak.berlin](https://sneak.berlin)
- [vext.info](https://vext.info)
- [Image sizes guide](https://imagesuggest.com/blog/blog-post-image-size/)

## Project structure

```text
src/
  components/   # Header, Footer, ThemeToggle, etc.
  content/blog/ # Markdown/MDX posts
  layouts/      # BlogPost layout
  pages/        # index, about, blog listing
  styles/       # global.css
public/
  posts/        # Post images (referenced as /posts/filename.jpg)
docs/           # How-to guides and specs
vercel.json     # Build config + security headers
```

## Credit

Scaffolded from the [Astro blog template](https://astro.build/). Theme based on [Bear Blog](https://github.com/HermanMartinus/bearblog/).
