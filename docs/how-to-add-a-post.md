# How to Add a New Blog Post

## Basic post

1. Create a file in `src/content/blog/` named `YYYY-MM-DD-your-post-slug.md`

2. Add front matter:

```yaml
---
title: "Your Post Title"
pubDate: 2026-05-10
description: "One sentence about the post."
tags: ['tag1', 'tag2']
heroImage: "/posts/your-image.jpg"  # optional
---
```

3. Write your content in Markdown below the front matter.

## Images

- Drop image files in `public/posts/`
- Reference them as `/posts/filename.jpg` in `heroImage` or inline in Markdown

## MDX (interactive content)

Rename the file to `.mdx` to use Astro components:

```mdx
---
title: "My Interactive Post"
pubDate: 2026-05-10
description: "..."
tags: []
---

import MyComponent from '../../components/MyComponent.astro';

<MyComponent />
```

MDX supports all standard Markdown plus JSX-style component imports.

## Frontmatter reference

| Field         | Type     | Required | Notes                              |
|---------------|----------|----------|------------------------------------|
| `title`       | string   | yes      |                                    |
| `pubDate`     | date     | yes      | `YYYY-MM-DD` format                |
| `description` | string   | no       | Used in SEO meta and post listings |
| `tags`        | string[] | no       | Displayed under the post title     |
| `heroImage`   | string   | no       | Path to image in `public/`         |
| `updatedDate` | date     | no       | Shows "Last updated on..." note    |
