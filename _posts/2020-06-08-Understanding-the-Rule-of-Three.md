---
layout: post
title:  "Understanding the Rule of Three"
subtitle: "Adopting Benefit-First is how you'll fully understand the Rule of Three to make better engineering decisions."
categories: [engineering]
tags: [engineering]
header-img: 'https://imgs.xkcd.com/comics/automation.png'
---
There is this subconscious understanding that unnecessary complexity is root of all evil in software development. We have been [fiercely ranting about the dreadful experience](https://twitter.com/search?q=dependency%20hell&src=typed_query) caused by the dependency hell. We've been detracting legacy code as [big ball of mud because](https://s3.amazonaws.com/systemsandpapers/papers/bigballofmud.pdf) nobody can honestly understand how it works. Fearlessly, we've been [shushing our developer mates](https://twitter.com/kumar_abhirup/status/1267777496524574721) arguing that they've done the wrong coding choices. 

It is funny how Machiavellian we can become in name of the simplicity. Surely, we can have better days with less cyclic dependencies, we probably can adopt better design patterns or even avoid syntaxes that ordinary people can't easily read in our source code. But, to remove complexity from our daily routine, we need a systematic approach that help us to weigh up the benefits of every piece of code we introduce in our software.

## The rule of three
<p class="image right-panel no-background">
    <img src="https://imgs.xkcd.com/comics/automation.png">
    <small>Source: <a href="https://xkcd.com/1319/">xkcd</a></small>
</p>

**Benefit-first** [^3] is a technique to guide the decisions you made when you develop a software. Basically, before introduce any piece of code on your software you have to list pros and cons of adopting it, and analyse the impact of maintaining it in short and long term. If the benefit of introducing it is bigger than the cost of maintaining it, then it is probably safe to proceed.

The first piece of advice I've ever read that advocated a similar approach came from Martin Fowler on his iconic book [Refactoring](https://archive.org/details/isbn_9780201485677). According to him, we should adopt the [rule of three](https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming)) to drive our refactoring decisions, avoiding overcomplicated strategies that might need to [be rethink again in the future](https://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction). As the book got notorious and relevant, the Rule of Three has been constantly repeated on the internet with subjective definition and, in some cases, with no clear steps to reproduce this technique in the future.

## Distinguishing Chance, Coincidence and Trend
My professor of Statistics once taught me about a similar concept: identifying trend behaviour. Letting all mathematic formulas aside, I would reproduce his reasoning and translate to the Software Development world as follows:
- __Take a chance and design the most simplistic solution to your problem__. As you have a simple piece of code testing it take less time, and it will be easier to adapt in case your needs change.
- __Treat further changes as a coincidence__. We have this instinct to introduce generic solutions to solve problems that might happen in the future. A premature generalization might require further refactoring, or might even be removed altogether being replaced by a different approach in the future. Sometimes, a simple if/else statement is our best choice.
- __A good hint to identify trend behaviours is the introduction of duplicated pieces of code__. That's the perfect opportunity to introduce abstractions that not only removes these duplications but also allows developers to extend the current logic without modifying it [^2].

By looking to these rules it is clear that they focus on the software design, diverging from its original proposal as a technique to help you to refactor your code wisely. _By adopting it in the early stages of the development, we enforce simple and evolving code over reactive trial-error-refactor approach_, where complex solutions will be introduced only when we need to solve a complex problem.

## Final Thoughts
Sometimes the requirements are clear enough so you can jump into the complex solution straightaway, but that is not usually the case. The above mindset was an attempt to narrow down the Rule of Three scope and try to make it more reproducible on a daily-basis. As a bonus hint, I'd like to left here another definition that approaches the Rule of Three as something totally different way. I found it when I was reviewing the references for this article and it has been echoing on my mind for a bit of time already. Hopefully it will be just as enlightening for you as it was for me.

<blockquote class="quote">
    <p>There are two "rules of three" in [software] reuse:</p>
    <ul>
        <li>It is three times as difficult to build reusable components as single use components, and</li>
        <li>a reusable component should be tried out in three different applications before it will be sufficiently general to accept into a reuse library.</li>
    </ul>
    <footer>
        <cite>- Fact#18 from <a href="https://www.amazon.com/Facts-Fallacies-Software-Engineering-FORGOT-ebook-dp-B001TKD4RG/dp/B001TKD4RG">Facts and Fallacies of Software Engineering</a></cite>
    </footer>
</blockquote>

[^1]: By [Auric Goldfinger](https://en.wikipedia.org/wiki/Auric_Goldfinger), taken from [Ian Fleming](https://en.wikipedia.org/wiki/Ian_Fleming)'s novel [Goldfinger](https://en.wikipedia.org/wiki/Goldfinger_(novel)), Ch. 14 : Things That Go Thump In The Night
[^2]: The [Open-Closed Principle](https://stackify.com/solid-design-open-closed-principle/) is the perfect technique for this job as, by definition, it closes out methods or classes for modification by introducing customization points that allow it to be extended from outside.
[^3]: Benefit-first isn't a term carved by me. Although I've never saw any specific mention to this term on a book or a lecture before, I heard about it a few years ago from my [first mentor](https://twitter.com/anielson) and I've been using it since then.