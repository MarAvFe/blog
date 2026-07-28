---
title: "How companies track you by email - and what to do about it"
pubDate: 2022-12-08
tags: ['privacy', 'tip', 'tracking', 'url']
description: "Learn how email tracking pixels work and how to protect yourself from marketing surveillance."
---

We know companies track us. Our phone is always listening, we haven't even shared our next purchase with our friend and we're already seeing the thing in ads.

Spoiler alert: algorithms are smart. They have the history of your Google searches, your watched Amazon products. They also know if you opened an email or not; have you ever received this friendly email of "Hey, we noticed you haven't interacted with our emails in a while!"? They know.

Well, whether you want to be tracked or not, I just want to give you the tools to choose to take action or not.

> tl;dr. Remove everything to the right of `?` from your URLs

## Uniform Resource Locators

We know these as links, references or [URLs][urls], they are pretty common actually. They are unique identifiers for Internet resources like websites, videos and pictures. Everything in the web is reached through a URL.

### Structure

A URL has a very simple structure. Let me break down the next example URL:

`https://www.example.com/path/to/page?parameter1=value1&parameter2=value2`

- `https` — Protocol (secure HyperText Transfer Protocol)
- `www.example.com` — Domain
- `/path/to/page` — Path
- `?` — Query string separator
- `parameter1=value1&parameter2=value2` — Query parameters

The **query string** is everything after the `?` and before any `#`. This is where websites attach metadata to links.

## Tracking Parameters

Companies attach tracking parameters to URLs so they can track where clicks come from, which email campaign worked, which user clicked, etc.

Example tracking parameters in a URL:

`https://example.com/product?utm_source=email&utm_medium=newsletter&utm_campaign=summer_sale&utm_content=button_cta`

Breaking this down:
- `utm_source=email` — Traffic source
- `utm_medium=newsletter` — Medium type
- `utm_campaign=summer_sale` — Campaign name
- `utm_content=button_cta` — Specific content identifier

Every time you click this link, the company logs: which email list you're on, which version of the email you received, which button you clicked, and which campaign you're interested in. This builds a profile of you.

## Email Tracking Pixels

Beyond URL parameters, companies use **tracking pixels** — tiny, invisible images embedded in emails. When your email client loads the image, the company's server logs:

- That you opened the email
- When you opened it
- What device you used
- Your IP address (approximate location)
- Whether you opened it multiple times

This is why your email provider asks if you want to load images. Many spam and tracking emails rely on this.

## How to Protect Yourself

### 1. Clean Your URLs

Before clicking a link from a promotional email, check the URL in your browser. Remove everything after and including the `?`:

**Before:** `https://shop.com/sale?utm_source=email&utm_medium=promo`

**After:** `https://shop.com/sale`

### 2. Disable Image Loading in Email

Most email clients allow you to disable automatic image loading:
- Gmail: Settings → Advanced → Images → Ask before displaying images
- Outlook: File → Options → Trust Center → Automatic Download
- Apple Mail: Preferences → Viewing

### 3. Use Email Aliases

Create temporary or separate email addresses for shopping, newsletters, and promotions. This isolates tracking data.

### 4. Unsubscribe from Unwanted Lists

Click the unsubscribe link at the bottom of marketing emails (usually required by law). This reduces tracking emails overall.

### 5. Use Privacy-Focused Email Providers

Consider services like ProtonMail or Tutanota that don't load images by default and encrypt your mail.

## Conclusion

Companies will continue to track you. The goal is not privacy perfection (impossible), but rather **conscious control** over how much data you leak. Clean URLs, disable images, use aliases — small actions add up to better privacy.

[urls]: https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL
