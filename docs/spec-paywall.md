# Spec: Gated Posts / Low-Level Paywall

## Goal

Allow some blog posts to be visible only to readers who have authenticated. Keep it lightweight — no heavy auth infrastructure, compatible with a static Astro + Vercel deployment.

## Approaches

### Option A: Static passphrase (simplest)

- A shared passphrase is distributed to intended readers (email, DM, etc.)
- The post page prompts for it, hashes it client-side, and compares against a stored hash
- No backend required
- Downside: everyone shares one key, no revocation per user

### Option B: Email magic link (recommended)

- User enters email on a gate page
- A Vercel Edge Function sends a signed link via email API (Resend, Postmark, etc.)
- Link encodes a short-lived JWT (signed with a `MAGIC_LINK_SECRET` env var)
- Post page verifies JWT on load, caches token in `localStorage` until expiry
- Per-user control, no password management

### Option C: Third-party SaaS (Memberstack, Outseta, Memberful)

- Drop-in with billing support
- Overkill for a personal blog; adds monthly cost

## Recommended implementation (Option B)

### Frontmatter change

Add `gated: true` to any post you want to protect:

```yaml
---
title: "Members Only Post"
pubDate: 2026-06-01
gated: true
description: "..."
---
```

Update `src/content/config.ts` schema:

```ts
gated: z.boolean().optional().default(false),
```

### Files to create

| File | Purpose |
|------|---------|
| `src/components/PaywallGate.astro` | UI shown to unauthenticated users (email form) |
| `src/pages/api/magic-link.ts` | Edge Function: validates email, sends magic link |
| `src/pages/api/verify-token.ts` | Edge Function: validates JWT, returns session token |
| `src/pages/auth/verify.astro` | Landing page for magic link clicks |

### Updated BlogPost layout logic

```astro
---
const { gated } = Astro.props;
const token = /* read from cookie header on server, or use client hydration */;
---

{gated && !token ? <PaywallGate /> : <slot />}
```

For a fully static build, the gate check runs client-side via a `<script>` that reads `localStorage`.

### Security notes

- Client-side gating is **not DRM**. A determined user can bypass it.
- Suitable for: supporter-only content, draft previews, early access posts
- Not suitable for: paid subscriptions or genuinely confidential content
- For stronger protection, use Vercel Edge Middleware to gate at the HTTP level before HTML is served

### Demo article

```yaml
---
title: "Behind the Scenes: How This Blog Works"
pubDate: 2026-06-01
gated: true
description: "A demo of gated content — only accessible with a valid token."
tags: ['demo', 'members']
---
```

## Next steps

1. Decide Option A (simple static passphrase) or Option B (email magic link)
2. Build `PaywallGate.astro` component (email input UI only, no logic)
3. Implement auth layer based on chosen option
4. Add `gated` field to content schema
5. Update `BlogPost.astro` to conditionally render gate or content
6. Test: visit gated post without token → gate shows; with valid token → content shows
