---
layout: post
title:  "Producing Professional Deliverables"
categories: [engineering]
tags: [engineering, master]
---
When someone is described as a professional one might see that person as someone who does something for a living. Others might agree with the Cambridge dictionary, seeing professionals as those who have “[...] the type of job that needs a high level of education and training” [^1]. Perhaps we can all agree that the meaning of words evolves as time passes by - having its meaning adapted to suit a more recent context. Maybe “professional” in the modern days might’ve acquired different meaning from what it used to have in the past.

## The need for consistency
Let’s take football players [^2] for a moment. They only begun getting paid as professionals since last quarter of the 18th century [^3] but when we compare the quality of the games back then with nowadays’, and we put nostalgia aside, the gap is huge. Pelé, Maradona, Zidane and Messi are historically regarded as those who took the game to the next level. But so did managers and coaches, “who dreamed up catenaccio and zonal marking and the sweeper system, all of it designed to stop the virtuosos showcasing their talents” [^4].

The bar was raised to a point where we’ve been scoring less than a hundred years ago [^4]. While only a few players can keep up with their careers for more than 8 years [^4], most of them tend to retire quite early - especially if compared to a software engineer. In fact, the most successful footballers were those who had more **consistent performance** in their teams.

_Consistency_ is probably the most desirable skill I look for when I hire someone. Independently on how senior as an engineer you are, delivering consistent results means that I can predict how long it takes for you to finish your tasks, how many issues you might introduce in software and, how much effort should I put for you to reach the ideal performance within the team.

The more senior you are the fewer issues you might introduce, the faster you can learn and adopt a new technique and the more adaptable you are to tackle problems you’ve never faced before. But, if you don’t master the techniques you’ve learned before in a way that you produce consistent results, your seniority might be easily replaceable by a junior. Think about it, if you can learn consistently, the more I teach you the more improvement I can see on your deliverables. On the other hand, a non-consistent senior developer might learn something new and put it in practice straight away but may struggle to use it under a different scenario as he hasn’t trained long enough to master his new skill.

## Reproducibility is key
If we go a few centuries back, we would see craft workers (such as [Artisans](https://en.wikipedia.org/wiki/Artisan)) in action, perhaps the contemporary version of the Software Engineer as we know it [^7]. A skilled craft worker creates material objects partly or entirely by hand. Artisans were the dominant producers of consumer products before the Industrial Revolution. Once passed through the career chain from apprentice to journeyman, he could be elected to become a master craftsman, enjoying one of the highest social statuses in their communities at the time. [^6]

The success of the [Agricultural Revolution](https://en.wikipedia.org/wiki/British_Agricultural_Revolution) of the 18th century created a favourable climate for industrialization. With increasing production of food, the British population could be fed at lower prices with less effort than ever before. The surplus of food meant that British families [could use the money they saved to purchase manufactured goods](https://study.com/academy/lesson/causes-of-the-first-industrial-revolution.html). Under given circumstances, it's easy to understand that craft workers weren't enough to cope with the higher demand for goods that were needed.

Just as the demand for consistent and reliable delivered goods ended up replacing artisans with machines, <span class="highlight">the overwhelming demand for value to be provided by the current software industry will also raise the bar</span> in a way that Software Engineers who lack precision, predictability or measurement won't make it far in their careers.

To better understand this idea, let's assume a developer was elected by his team to design a microservice from scratch. On his team, there's no one in charge of the infrastructure or taking macro architectural decisions. A good outcome from this project might be big deal for his reputation, especially if no one else has to worry about bugs if there's a brief README file explaining how to run the software locally and releasing a new version of it is just a matter of having a Pull Request approved.

One might argue that taking care of all of these details consumes valuable time that would be better spent implementing new features. But I dread the days when I had to stop what I was doing to answer questions from my colleagues when they have to maintain a software I've previously written without proper documentation. Eventually, I realized that when the README file is good enough I have fewer interruptions. When my unit tests cover most of - if not all - the source code, I have fewer bugs to fix and hence have more time to create something new.

A wise engineer, though, may go even further and streamline his knowledge in a way that can be easily reproducible as well. What if a Kotlin developer has [a small Gradle project](https://github.com/Skullabs/kos-sample-gradle) on his Github account? Why don't we create [a module to deploy our software using Docker](https://github.com/miere/terraform-aws-fargate-ha-web)? Wouldn't it be useful if you save that [small script](https://github.com/miere/terraw) that automates everything you need to run your terraform scripts? If designing software is the main part of your job, perhaps you should figure out a way to reproduce the boring tasks as quickly as possible when the necessity comes up you will be able to deliver a masterpiece much faster than anyone else.

## Going beyond Kent's Simple Design
Speaking of masterpieces, in the 1990s Kent Beck introduced The Four Elements of Simple Design, a principle that would be later immortalised in his [book Extreme Programming Explained](https://www.amazon.com/gp/product/0201616416). He states these rules as follows:
- Runs all the tests
- Has no duplicated logic. Be wary of hidden duplication like parallel class hierarchies
- States every intention important to the programmer
- Has the fewest possible classes and methods

His rules were written in priority order, where the ones at the top take priority over the following ones. It comes as no surprise that, if you can't afford the time to have all of it, he would like you to put more effort into tests. Being behind the roots of unit testing frameworks we have nowadays [^9], the author of [SUnit](https://en.wikipedia.org/wiki/SUnit) and [co-authoring](https://en.wikipedia.org/wiki/Kent_Beck) JUnit with Erich Gamma, he's an avid advocate of testing as feedback tool [^8], something you can read from the man itself on his award-winning book [^10] [Test-Driven Development by Example](https://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530/).

Let's take the popular [MVC pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) to draw a comparison with Beck's rules. Between the late 2000s and early 2010s, MVC was considered the _silver bullet pattern_ for his adopters [^11]. In an era where nobody was actually concerned about [Separation of Concerns](https://en.wikipedia.org/wiki/Separation_of_concerns) and the front-end was mostly rendered by the backend, it was indeed quite convenient to grow your software by simply placing classes in one of its three buckets. Despite its convenience, not all software designed mostly using MVC (from end-to-end) is easy to maintain, once it grows bigger the need for new features to be included urges us to adopt different approaches - a phenomenon well described by Meir Lehman [in another master piece](https://ieeexplore.ieee.org/document/1456074) [^12].

Kent's rules, on the other hand, are distinguished from other methodologies by focusing on the _outcome you might have_ instead of _how one has to organize his code_. It is benefit-driven, encouraging you to adopt whatever strategy you have in your playbook as long as you respect those outcomes. As a result, maintainability and fast feedback on breaking changes will be the benefits those who adopt it will be rewarded with. That's the actual mindset a professional has that to keeps the **quality** of their deliverables higher than the average.

Since it's been more than 2 decades since these rules have been crafted, if you allow me, I'd like to respectfully include a couple of items that I think should be mandatory for any professional delivery in software.
1. It should be possible to run all your tests with a single (yet simple) command.
1. It should be possible to run your software with a single (yet simple) command.
1. It should be possible to package your software with a single (yet simple) command.

While these 3 rules I'm introducing might be seen as silly at first glance, it makes perfect sense when you need to handover your deliverable to someone else. Just as Beck's rules, they've been ordered by priority as well, thus, if you can't afford to have all of them, just make sure one can painlessly run all tests and check for regressions on your software. The last two rules are somewhat related, as you need to package your software to run it locally. Thoroughly reviewing all the dependencies (libraries, tools, and dependent services) your service relies on are [the foundation to have a hassle free CI/CD setup process](https://dzone.com/articles/learn-how-to-setup-a-cicd-pipeline-from-scratch).

## Takeaways
Professionalism is a quite subjective topic, but it worth keeping in mind that we're living in a different world where the current standards of our industry expect higher delivery pace, and less time spent on bugs or amending poorly developed features. Even complex structures have been shrewdly discouraged. In fact, managers are going one step further in this direction, trying their best to reduce the learning curve when developers jump in to maintain a different microservice, independently from whether the developer is a newcomer or a long-time hero within the company [^13].

If I could sum up the aforementioned topics, I'd say the Professional Software Engineer from nowadays should be consistently capable of delivering high-quality software in a way that anyone with the source code could maintain it with no hassle.

---
_Special thanks to [Gabriel Jacques](https://www.linkedin.com/in/gabrielsjacques/), Ricardo Baumgartner and [Varun Naik](http://vnaik.com) for their contributions._

[^1]: [Cambrige dictionary's definition of the word "professional"](https://dictionary.cambridge.org/dictionary/english/professional)
[^2]: [Football](https://en.wikipedia.org/wiki/Football_player), also known as soccer for the Americans
[^3]: [Fergus Suter](https://en.wikipedia.org/wiki/Fergus_Suter) was arguably the first recognised professional footballer.
[^4]: Instead of the consistent and insistent downward trend in goals we have seen over a century and a half of play, in the last 60 years or so there appears to be a levelling off. Goals are not dying. They are plateauing. Scoring has remained essentially stable in the last two decades, perhaps even as far back as the 1970s. See: [The Great Leveling](https://slate.com/culture/2013/08/the-numbers-game-why-soccer-teams-score-fewer-goals-than-they-did-100-years-ago.html)
[^5]: Professional soccer careers can be very lucrative, but tend to only last for around eight years, with the average age of retirement being 35 years old. Check the list of the [Oldest Soccer Players](https://www.oldest.org/sports/soccer-players/) for more details.
[^6]: See _History of Western Civilization_ at Boise State University's ["Document No.23"](https://web.archive.org/web/20090107061228/http://history.boisestate.edu/westciv/medsoc/23.shtml). Archived from the [original](http://history.boisestate.edu/westciv/medsoc/23.shtml) on 2009-01-07. Retrieved 2009-01-08.
[^7]: In fact, there's a whole movement in which developers describe themselves as Software Craftsman. Perhaps the best description of how Software Engineering became more relevant in the field can be found in [this article](https://en.wikipedia.org/wiki/Software_craftsmanship) in Wikipedia.
[^8]: [According to Beck](https://medium.com/@kentbeck_7670/programmer-test-principles-d01c064d7934), "Programmer tests are an oracle providing feedback coding-decision-by-coding-decision".
[^9]: Kent Bech is often cast as the mind that leads to the [xUnit](https://en.wikipedia.org/wiki/XUnit) frameworks being widely adopted.
[^10]: Co-authored by Addison-Wesley, the book is award-winning of the Jolt Productivity Award.
[^11]: [Here](https://twitter.com/miere/status/14496627913924608) is a discussion (in PT_BR) back in 2010 I had on Twitter about this very topic, showing how heated a conversation can get when enquiring MVC developers about MVC replacements. At the time, I was under heavy training by [one of my previous mentors](https://twitter.com/anielson), as he noticed my knowledge was mostly focused on hardware and low-level software development neglecting common design patterns.
[^12]: In 1974, Lehman stated in his book that "as an E-type system evolves, its complexity increases unless work is done to maintain or reduce it".
[^13]: It worth read about [how Netflix reinvented the way they manage their teams](https://hbr.org/2014/01/how-netflix-reinvented-hr), what are their expectations and for how long they've decided to invest and quality and reproducibility on their teams to avoid rework and spend more time on what will have higher return of investment.
