---
layout: post
title:  "Beginners guide to web-services scalability"
subtitle: "Beginners tips to efficiently design a scalable Web Service"
categories: [engineering]
tags: [engineering, scalability, Java]
header-img: 'https://www.carmatec.com/wp-content/uploads/2016/05/aws-managed-services.png'
---
<p class="disclaimer">
    This content was <a href="https://www.quora.com/What-are-some-tips-for-building-scalable-web-services-in-Java/answer/Miere-Teixeira?__nsrc__=4&__snid3__=20201704894">
    originally posted</a> in Quora long time ago. I decided to re-post it into this blog for the sake of
    cohesion and better discoverability. I also took the opportunity to revisit a few topics and fix
    several grammar issues. It can be used as a starting point, giving you a broad perspective of how to
    scale a web platform, but certainly your mileage might vary depending on the context.
</p>

<hr>

I don’t think that there’s a general answer to this question and, honestly, anyone well-intended would
need extra context to elaborate a good one. Every discussion about scalability that is raised on the
internet is usually guided by specific performance-related topics, which usually only applies to that
particular situation. When looking for broad tips about scalability, one is probably just trying to
be prepared for future problems and be ready when they pop in.

The best definition of scalability I’ve ever seen came from Dictionary.com - a simple statement that
drew my attention when I was reading this article[^1]:

<blockquote class="quote">
    <p>the ability of something, esp a computer system, to adapt to increased demands</p>
</blockquote>

That said, I would like to expatiate from this perspective and dig into some related topics that I think would be relevant to your question.

## High Availability
It may sound obvious but, as either Software and Hardware are susceptible to failures, we should focus our
effort on tools and techniques that would increase the uptime of our services. Several possible issues would
make them less reliable, such as when your software is partially down, your database is performing
an important ETL script or you’ve received a burst of requests in short time spam. Hence, it’s important
to be aimed with proper tools to make the software more resilient to such cases.

## Load Balancer
Load Balancer is the most common tool for these matters, providing a simple mechanism to evenly distribute
the load between a fleet of machines. All major cloud vendors have a managed Load Balancer[^2][^3][^4],
so you don’t have to deep dive into low-level network protocol knowledge to have it properly configured.
You also have well written Open Source solutions like NginX or HAProxy that would help you to achieve the
same results if you are concerned about being locked into a cloud vendor - at the cost of spending more
ours configuring suck tools by yourself.

## Metrics, Dashboards and Alarms
Metrics are the most important piece of your architecture. If I had to choose between Load Balancers and
Metrics, I would always choose the latest. Especially during the initial phase of your application, when
you have fewer customers, hence less load on your servers, all you need is to keep posted by how your
services are behaving and take action when something comes up.

A well-designed dashboard, fulfilled with relevant cherry-picked metrics, is a good start point to
understand how to scale your software. It will give insights on where are the biggest hotspots, which
Rest endpoints are the most demanding, which are the slowest and which puts more pressure on your
Database services. Aimed with this you’ll understand when you should include one or more instances
on your service fleet.

Then we have Alarms and Triggers. Once you’ve been monitoring your service for a while you’ll probably
notice that some routines are quite repetitive. You can use alarms to be notified in case something went
wrong. If these tasks can be done programmatically, you can certainly trigger actions and automate most
of these tasks. As an example, high CPU alarms could trigger an action to automatically increase the
umber of instances of your service fleet (AutoScaling?).

At this point, you might be able to Observe your whole system. I'm intentionally picking the word
"observe" instead of "monitor" because the latest has been dramatically linked to the analysing metrics
individually. Recently, though, observability has been trending as a slightly different approach where
(we can summarise to) analyse how the important business-related bits of your system (infrastructure +
software) behaves. The guys from NewStack have covered this topic very well recently [^6].

At this point, you (or your team), might be concerned about how to balance the need to include new
features on your software (time-to-market) and ensure that your users will have a good experience
(maintaining the software healthy and reliable). Monitoring (the Metrics and Alarms) and Observability
are the key techniques to let you start simple, being the best decision-making tool, in such a small
investment, you will ever have. You can use it to postpone performance improvements to the last
responsible moment, or even use it as an excuse to start your software as a monolith and create
microservices only when you’ve identified that a particular piece of your service needs to scale out[^5].

It worth repeat that all the biggest cloud vendors have easy-to-use Managed Monitoring solutions, so
you can have all sorted out in a few minutes (hours if that’s your first time).

## Continuous Deployment
CI/CD is quite an old topic, nevertheless it still a relevant and underrated subject that most architects
and software don’t take advantage of. Once you design software to be easily built, tested and packaged,
you can have your new features deployed into production in a few seconds (minutes depending on the
size of the project).

CI in general is the right tool to scale your Quality Assurance team, continuously running all the good
techniques they know every time the source code changes. Software Architects can also take advantage
of these tools to check if unit tests are broken, or if Developers are not following the expected code
convention, or if you mistakenly committed credentials in your source code or even if you accidentally
included a version of a library with a known security issue.

One may see it as an optional step, somewhat cumbersome or even unnecessary. But, if the goal is
scalability, team scalability matters. The more automated the better. It necessarily means less
repetitive tasks, a codebase less susceptible to failure, being able to find bugs before deploying
the software into production, etc. There’s no rocket science here, any simple tool can be used to
achieve all the above-described goals. If you have money (and patience) you can use Atlassian Bamboo,
or the popular open-source Jenkins deployed on your premises. If you are like me and don’t want to
spend time managing build instances and agents, you should definitively give it a try on CircleCI,
CodeShip or GitLabCI. AWS is also offering similar services in the usual pay-as-you-go fashion.

## Application Performance Monitoring
By choosing a good Application Performance Monitoring (APM for short) Tool, you will have all extra
knowledge about how your application works internally. Even if you have little-to-no-knowledge about
your chosen development platform, you will be able to use these extra metrics to take sensible action
whenever incidents happens.

Usually, these tools introspects your application (in runtime), adding extra execution points that
collects data (like memory and CPU usage by process, request throughput, etc), sends it to a centralised
application that groups them together and generates useful report about your application healthy.

NewRelic and DataDog are probably the most advertised APM solutions you will find on the internet. They
are reasonably priced - although they can get expensive quite quickly - and offer a comprehensive
feature set on their portfolio, being the ideal solution when you want to solve application performance
issues in a short notice. However, some major cloud vendors started to offer similar solutions - being
AWS X-Ray the most mature one.

I encourage you to pursue an OpenSource solution whenever the costs start to become prohibitive. Each
ecosystem has its own set of tool, it's worth investigate the one that best fits your needs. 

## The Chaos-Day is upon us
Now you have properly invested your time by setting up a highly available software, configured dozens
of important alarms based on the key metrics your application provide and have cleverly hooked some
auto-scaling trigger in case the Heap memory consumption is greater than the expected. You feel like
you have nothing else to worry, right?

Well, not really! Now that everything is set up we have to define a strategy to cope with the Caos Day:
the day your server will go nuts, and you have to fix it as fast as possible.

What does it have to do with Scalability? Well, no software is perfect, therefore, no
automation will be perfect too. You need to be prepared to manual scale your software in case of
a severe incident happens and, in the worst case scenario, you might need to rebuild it from ground up.


### A good enough Disaster Recover plan
I really encourage you to have a disaster recover plan in place. It will take you one or two days to
have it thoroughly tested, but it's worth every second spent on it. Keeping simplicity in mind, after
all we improve this later on, I'd focus on:

- Having a fresh backup will give you piece of mind, allowing you to carry on, knowing that no matter
  how drastic is the problem, you will be able to start over.
- Infrastructure as Code. This is an important bit, you must be able to recreate your whole
  infrastructure in a short notice. Having it automated from the day one will save you time (money)
  and hair loss.

With these ready, all you need is to ensure that you are easily able to restore your backup
as soon as your new infrastructure is ready. Bear in mind that, you need to constantly revisit this
from time to time, you don't want to have to test it when you need it to be working the most.

## To wrap up
Choose Simplicity as the backbone of your coding design, Automation as the way to deliver any solution
and Monitoring Tools as the source of truth for your further architectural decisions, and you will have
an efficient and small team capable to have same productivity as a big wealthy tech company.

Smaller and efficient teams will make your company more profitable, more money to be paid to the
employees. One may see this as utopia, but from my personal experience I’ve witnessed a few companies
awarded its employees with a (big) slice of the profit they’ve got by reducing their operational cost.


[^1]: [What Is Scalability?](http://shiflett.org/blog/2003/what-is-scalability)
[^2]: [What Is an Application Load Balancer?](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
[^3]: [Overview of Load Balancing - Google Cloud](https://cloud.google.com/load-balancing/docs/load-balancing-overview)
[^4]: [What is Azure Load Balancer?](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)
[^5]: [Monolith First](https://martinfowler.com/bliki/MonolithFirst.html)
[^6]: [Monitoring vs Observability: what's the difference](https://thenewstack.io/monitoring-vs-observability-whats-the-difference/)
