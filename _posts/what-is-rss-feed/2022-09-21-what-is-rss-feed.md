---
layout: post
title: "What is RSS feed?"
date: 2022-09-21 23:50:20 -0600
modified: 2022-09-22 18:21:20 -0600
tags: [blogging, rss, tool]
description: I learn and explain what is and how to use RSS Feeds
excerpt: I learn and explain what is and how to use RSS Feeds
---

Well, I did it. I created my blog! Rest assured, I didn't come up with all of it by myself. Big thanks to [github.com/piharpi][piharpi] for creating [jekyll-klise][jekyll-klise] awesome [Jekyll][jekyll-home] Theme.

But now, I'm noticing something funny, this template has this funny feature of RSS feed that I've seen since... 2005? I can't recall. Let's learn how to use it in 2022.

## RSS Feed

<figure>
<img src="{{page.url}}/rss-logo.png" alt="RSS Logo">
<figcaption>RSS Logo</figcaption>
</figure>

> RSS stands for Really Simple Syndication, and it’s is a simple, standardized content distribution method that can help you stay up-to-date with your favorite newscasts, blogs, websites, and social media channels. [Source][rss-lifewire]

Ok, simple is yet to be seen. But first, what is "Syndication"?

> Syndication: organizing into or administering as a syndicate [Source][syndication]

Ok, and Syndicate?

> An association of people [...] to promote a common interest [...].[Source][syndicate]

Cool. So RSS is a really simple way to create an association of people to promote a common interest. Something like social media memberships but w/o a central hub to check your feed. You get to subscribe to your own set of interests, receiving notifications of only topics you specifically requested for. This sounds like **a nightmare** for mainstream social media. Why, you say? That's a future topic for a post.

## How do I use RSS Feed

1. Go get [an RSS Feed reader][top-7-readers]. (I'm going with [Good News][good-news]).
2. You'll need to create an account, most likely.
3. Find an RSS feed link to subscribe to. You can try with [mine](/feed.xml) ✨. Check this article top right section, click it.
4. Go to your feed page and read my articles. Not many at the time of writing, but enough to test.

## This is WIP.

You may see this article but I still need to fix some stuff from my url setup :P

## Conclusion

Personally, I think RSS may be standardized but it's not as simple.

- Most readers out there are paid services. Hence, social media is more convenient
- It's not simple for development. Even considering this jekyll-klise theme already supports feed generation, readers structure don't seem to work out of the box with localhost environments.

[piharpi]: https://github.com/piharpi
[jekyll-home]: https://jekyllrb.com/
[jekyll-klise]: https://github.com/piharpi/jekyll-klise
[rss-lifewire]: https://www.lifewire.com/what-is-an-rss-feed-4684568
[syndication]: https://www.wordnik.com/words/syndication
[syndicate]: https://www.wordnik.com/words/syndicate
[top-7-readers]: https://bloggingwizard.com/free-rss-feed-readers/
[good-news]: https://goodnews.click/