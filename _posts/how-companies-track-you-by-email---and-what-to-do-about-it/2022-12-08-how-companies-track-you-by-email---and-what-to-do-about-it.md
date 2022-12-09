---
layout: post
title:  "How companies track you by email - and what to do about it"
date:   2022-12-08 23:30:20 -0600
tags: privacy tip tracking url
---

We know companies track us. Our phone is always listening, we haven't even shared our next purchase with our friend and we're already seeing the thing in ads.

Spoiler alert: algorithms are smart. They have the history of your Google searches, your watched Amazon products. They also know if you opened an email or not; have you ever received this friendly email of "Hey, we noticed you haven't interacted with our emails in a while!"? They know.

Well, whether you want to be tracked or not, I just want to give you the tools to choose to take action or not.

> tl;dr. Remove everything to the right of `?` from your URLs

## Uniform Resource Locators

We know these as links, references or [URLs][urls], they are pretty common actually. They are unique identifiers for Internet resources like websites, videos and pictures. Everything in the web is reached through a URL.

### Structure

They follow a [very well detailed structure][urlsyntax] (or syntax if you will) but the most common and simple form is as follows:

```url
protocol://hostname.FQDN/path?parameters
```

This is a very complicated way to describe something more familiar:

```
https://google.com/images?page=2
https://     google    .com  /images ?page=2
protocol://  hostname  .FQDN /path   ?parameters
```

So, why is this interesting? Because **the parameters part is arbitrary**. The resource is usually located in a particular url, but they can read extra data from the parameters.

Whenever anyone in the world opens the URL, the server provides (sends) the resource. e.g. the picture of a cat.

### Visibility

URLs are often recognized by users by a long blue string in any text. You can recognize some links within this post bu the text color difference. But, did you know that buttons are in fact masks for links? That images are stored in a different place than the website you see? Images can be masks too, especially in emails.

### Basic email security

If you hadn't noticed, emails are very stiff. You don't see videos, animations, complex responsiveness. This is because emails are insecure by definition, so any respectable email provider will block the loading of links (libraries or code) that allow for these fun Internet things to happen, because allowing these features provides support for more evil things to happen. And now everything has been blocked, companies and attackers don't have an other choice than entice you into browsing to their website, how? you guessed it, with links.

## Why do I care?

They can know if *you* downloaded the cat picture, and tell you apart. Run some analytics on your behavior, which they use to show you better ads. But they choose the ads, the algorithm categorizes you within several labels so they can profile you. You're a "24 femal who likes bowling and hiking, but their mother has diabetes" or you're a "54y/o male who enjoys soccer who is struggling financially but is interested in buying a new TV". Then they sell your information. Privacy is a complex topic, but they can know a lot from you just by whichever links you open in your phone or pc.

### Profiling

Just to load an image, your browser needs to get data from a URL. If you open the email, your browser renders the content and this image can identify you.

Imagine I have this database:

```
1. Padme
2. Anakin
3. Obi Wan
```

And I have a funny cat image I want to share with them. Stored in a server in `http://server.com/funny-cat`. And I want to keep track of who opened the image, so I modify my database as such:

```
id  name     opened?
1   Padme    no
2   Anakin   no
3   Obi Wan  no
```

And then I send 3 emails, very simple with this content to each:

```
Padme: Hey, link to my cat! http://server.com/funny-cat?id=1
Anakin: Hey, link to my cat! http://server.com/funny-cat?id=2
Obi Wan: Hey, link to my cat! http://server.com/funny-cat?id=3
```

My server is just ready to send the image to anyone who requests it. But then, my server receives: `Hey, check my cat in this link! http://server.com/funny-cat?id=2`. We know this was Anakin. It sends the image over the Internet, but it also updates the database as:

```
id  name    opened?
1   Padme   no
2   Anakin  yes
3   Obi Wan no
```

This way I can know Anakin was interested in my cat. Then I profile him as such. And maybe sell to a pet's shop that he likes cats and may be willing to purchase cats stuff from them. Anakin's information is money for me.

## What can I do?

### 1. Be mindful of emails you open

If the subject does not resonate a single work with you, just avoid it, I promise you'll not miss on a real Nigerian prince fortune. They can also embed images of 1x1 pixels that you may not notice, but they still can load a full URL. You can also [disable images from loading in your mailbox][disableimages], that's up to you.

### 2. Right-click, "Copy link address"

Whenever opening a link or clicking something, just right-click it and select "Copy link address". Open a new incognito window from the top right corner of your browser, paste the link and remove everything from the question mark to the right. It will work 9/10 times as expected, you'll get to your post or image.

Below are 2 real examples i received in my email today. These actually inspired me to write this post:

```
Full URL
https://www.bancobcr.com/wps/portal/bcr/bancobcr/acerca-del-bcr/responsabilidad_social/finanzas_en_accion/episodios/episodio_aguinaldo/?&utm_source=correo&utm_medium=clientes&utm_campaign=finanzas%20en%20acci%C3%B3n%20&utm_content=aguinaldo%202022&utm_term=ahorro%20

Shortened URL
https://www.bancobcr.com/wps/portal/bcr/bancobcr/acerca-del-bcr/responsabilidad_social/finanzas_en_accion/episodios/episodio_aguinaldo/
```

```
Full URL
https://www.babycenter.com/baby/month-by-month/your-5-month-old-week-1_1141?liveconnect=83578105cb8ddb843qeaa5e3041ea4ea&utm_source=email&utm_medium=email&utm_campaign=en_US_mbtw_0_AB%202022-12-07&utm_content=A_1500&pe=&zdee=gAAAAAqhwzatXybUecJz-f_i5wSYBmcsXbK3ZnCa56LllxYjqph-jgvlGmCjvNLEXBpdg1Gycjgy31JpRXpXMtOzTri7IpP-fwA4a9DyJXFR2JuR1quCCqo%3D

Shortened URL
https://www.babycenter.com/baby/month-by-month/your-5-month-old-week-1_1141
```

### 3. Open every link in an incognito window

You should know that incognito window does not really protect from anything by itself. But if you open these links there, at least other websites yo umay be logged in within your browser, will not know you opened this link by any reference.

## Your take

Now you know. You can choose to be more private or not :) sorry to break it to you.

Do the experiment, open your email and find some of the unnecessary long links that track you.

[urls]: https://developer.mozilla.org/en-US/docs/Glossary/URL
[urlsyntax]: https://url.spec.whatwg.org/
[disableimages]: https://support.google.com/mail/answer/145919?hl=en&co=GENIE.Platform=Desktop
