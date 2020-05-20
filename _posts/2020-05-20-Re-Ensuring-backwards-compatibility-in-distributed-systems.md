---
layout: post
title:  "Re: Ensuring backwards compatibility in distributed systems"
subtitle: "A few remarks on StackOverflow post with the same name."
categories: [engineering]
header-img: 'https://149351115.v2.pressablecdn.com/wp-content/uploads/2020/05/iStock-1165279830-1103x630.jpg'
---

A few days ago, I spotted a blog post from StackOverflow that drew my attention: [Ensuring backwards compatibility in distributed systems](https://stackoverflow.blog/2020/05/13/ensuring-backwards-compatibility-in-distributed-systems/). That is the sort of topic I love to consume as it gives me new insights and let me know how people are solving similar problems. The article was engagingly good and kept me focused on reading it until the end.

I would like, though, to write a few remarks about a few definitions assumed in the article which, if taken by the book, are not strictly correct. The idea behind the following paragraphs is far from detracting the author or the post itself. StackOverflow has a massive audience and knowing the correct definition might help them to adopt the right technique for the right job.

## Conditions which the suggested deployment technique works
In the blog post, there is a topic about software deployment that covers a few important techniques that might be useful for developers to ensure backward compatibility between evolving versions of the same software.  The author emphasized, though, that they will "only work under two conditions", one of them is applying it to a "brand new software projects".

Reading the article I couldn't notice a single technique that could not be applied to old software. I had the opportunity to adopt those techniques myself in 2013 when I was hired by [Ibratan](https://www.ibratan.com.br/) to redesign their primary software. It was mainly written in C and COBOL and, by adopting a combination of [Feature Toggle](https://en.wikipedia.org/wiki/Feature_toggle) and [Canary Deployment](https://martinfowler.com/bliki/CanaryRelease.html), I was able to fix some undesirable behaviours the software had and introduce a new API layer written in Java 8.

Personally, there is no such thing as Old Project, or Legacy Software if you will. There are only Well Written Software and Poorly Written Software, and it is possible to adopt any technique you want in both cases. Arguably, you might see a greater benefit in adopting those techniques in a poorly written software as they usually demand more maintenance.

## Canary Release vs Blue/Green Deployment
Perhaps this is not directly related to the blog post itself, but to a universal feeling that Canary Deployment and Blue/Green Deployment are the same things. Despite their similarities, it is important to distinguish them apart as they introduce different benefits to our deployment pipeline.

The term **Blue/Green Deployment** was first introduced [ages ago](https://gitlab.com/snippets/1846041), having been carved by [Daniel Terhorst-North](http://dannorth.net) and [Jez Humble](https://www.thoughtworks.com/profiles/jez-humble) by early 2010s. The fundamental idea is to have two easily switchable environments to switch between, allowing the software to be pre-released and tested on a deployment environment similar to the production. Once considered stable, a switch mechanism takes place, redirecting user's request traffic to the just deployed software.

The [switch mechanism may vary](https://martinfowler.com/bliki/BlueGreenDeployment.html) depending on the business expectation (e.g. high availability SLAs) or different technical needs (e.g. run smoke tests before release) might you have. One of them is the Canary Release. It "is a technique to reduce the risk of introducing a new software version in production by slowly rolling out the change to a small subset of users before rolling it out to the entire infrastructure and making it available to everybody" [^1].

By introducing the ability to analyse the impact of the just-released software with real data coming from the production request stream, _Data Analysts_ and _Software Architects_ can measure the impact the new release will have, rolling it back if the results are not satisfactory. Blue/Green Deployment, on the other hand, is closely related to the deployment itself, therefore it focuses mostly on the technical side of it - namely high-availability and easy rollback.

## Final Thoughts
I'd like to stress that the richness of the blog post content should not be blurred away despite the two topics that I covered. Gather all the information needed to compose such post is no easy task and might take precious ours to compose and wrap it in a way that his audience might enjoy. Perhaps a few links in the original to an external content could be enough to clarify the points I've made here, although writing down a few paragraphs helped to keep my understanding of those concepts fresh.

[^1]: [Canary Release](https://martinfowler.com/bliki/CanaryRelease.html) by [Danilo Sato](http://www.dtsato.com/blog/).