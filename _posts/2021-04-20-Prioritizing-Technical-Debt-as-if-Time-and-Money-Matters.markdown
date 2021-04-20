---
layout: post
title:  "Analysis: Prioritizing Technical Debt - Part I"
subtitle: "Technical Debts as a concept is something usually underrated by several (if not most of) big companies. The amount of money and man-hour effort spent fixing problems is often pointed as an order of magnitude higher than avoiding it before being released into production."
categories: [engineering]
tags: [engineering, information architecture, cost management, lehman law, git, static code analysis]
---

<header class="briefing">
<div class="video"><iframe class="video" src="https://www.youtube-nocookie.com/embed/fl4aZ2KXBsQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
<p>
    This post is the part I of the video analysis in which I'll elaborate on a few points exposed by
    <a href="https://empear.com/blog/">Adam Tornhill</a> on a talk presented in the 2019 GOTO Conference
    that happened in Copenhagen. As he addressed several topics, I've decided to tackle it into different fronts.</p>
<p> In this initial post I'll cover the first half of the video where he approaches technical debts found
    within a single code base (or repository if you will). There are several points on his presentation
    that, I believe, are spot on and deserves to be transcribed and better explained. <i>Technical Debts</i>
    as a concept is something usually underrated by several (if not most of) big companies. The amount of
    money and man-hour effort spent fixing problems
    <a href="https://softwareengineering.stackexchange.com/questions/133824/is-it-significantly-costlier-to-fix-a-bug-at-the-end-of-the-project">
    is often pointed</a> as an order of magnitude higher than avoiding it before being released into production.</p>
</header>

<article class="timeline">
    <section>
        <time>0:37</time>
        <h2>Lehman Law's</h2>
        <p>Adam will use <a href="https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution">Manny Lehman's Laws of Software Evolution</a> as the foundation of his argument during the whole talk. <sup id="fnref:1"><a href="#fn:1" class="footnote">1</a></sup>:</p>
        <ul>
            <li><b>Continuing Change</b>: "a system must be continually adapted or it becomes progressively less satisfactory"</li>
            <li><b>Increasing Complexity</b>: "as a system evolves, its complexity increases unless work is done to maintain or reduce it"</li>
        </ul>
    </section>
    <section>
        <time>2:20</time>
        <h2>One shall focus on the real issue</h2>
        <p>
            As he points out, there's an inherent conflict between these two laws. <i>"On one hand, we have to continuously evolve and adapt
            our system but as we do, its complexity will increase which makes it harder and harder to respond to change"</i>. These are so
            intertwined that it prevents us to perceive the problems as it is, leading us to tackle <i>"the symptoms more than the root cause"</i>.
        </p>
        <p>
            What he's experienced is somewhat similar to what I've witnessed in the past few years. If we, as technical and business leaders,
            only monitor the tickets we have in the backlog we might no be able to identify the impact that technical debts impose to our users.
            Therefore, to actually solve the problem, we need to understand the underlying issue - the root cause of the problem. It might imply
            on revisiting a software, or component, design - or even how we approach and process the interaction with the user.
        </p>
        <p>
            It worth mention that Tornhill is not advocating perfectionism. In general, users don't mind to live with one or two glitches in the app
            as long as it doesn't impact their work routine. But as we neglect the existence of those technical debts, the time to release of new
            features or fix bugs grows bigger (and faster) than the symptoms experienced by the users.      
        </p>
        <p>
            The clear challenge for product and engineering teams is finding a balance between mitigating technical debt and
            ensuring the software still delivers valuable experience to its users.
        </p>
    </section>
    <section>
        <time>6:55</time>
        <h2>The perils of quantifying technical debt</h2>
        <blockquote class="quote">
            <p>We really have to consider what kind of behaviour do we reinforce by putting our quantitative goal 
                on technical debt. [...] People like us (developers) will optimise for what we are measured on. That
                most likely means that we're going to pick not only the simplest task, but we're going to pick tasks
                that we're comfortable with. [...] That also means that we lack the most important aspect of the
                technical debt: we lack the business impact.</p>
        </blockquote>
        <p>It's safe to say that, at this point in time, Adam addresses the biggest wound in the current state of the software
            development industry. We've been putting much more effort on the results (having less tickets in the backlog) than
            on the outcomes (deliver more value, or provide a better experience, to our users). By simply removing those issues
            from our sight we are neglecting to solve the root cause of the problem, as it doesn't guarantee our software won't behave
            poorly in the foreseeable future.</p>
    </section>
    <section>
        <time>10:50</time>
        <h2>Assessing the technical debt</h2>
        <p>Cyclomatic complexity<sup id="fnref:2"><a href="#fn:2" class="footnote">2</a></sup> is probably the most common tool
            used to identify whether or not a piece of code needs to be revisited due to its complexity. Adam points out, though,
            that "code complexity is only a problem when we have to deal with it". There's no point in optimizing a complex source
            that is unlikely to change in the foreseeable future.</p>
        <p>We can combine Cyclomatic Complexity with Code Change Frequency<sup id="fnref:3"><a href="#fn:3" class="footnote">3</a></sup>
            analysis. Together they give us a different perspective on how we've been dealing with the software, as we could use it
            to list which sections of it has been more frequently changed. This metric alone wouldn't be really useful, after all,
            why should we optimise something that is not complex at all.</p>
        <p>To better understand the process, Adam proposes us to use our VCS tool and to list the most frequently changed files over
            a given period of time. Once you spotted a file which has been constantly changed, one can be submit each of the changes
            (as taken from the VSC repository) to a complexity analysis. The result would a timed series of data that we can plot into Complexity Trend
            chart - as illustrated by the picture below.</p>
        <p class="image">
            <img src="https://codescene.io/docs/_images/ComplexityTrendSingleSample.png">
            <small>Picture taken from <a href="https://codescene.io/docs/guides/technical/complexity-trends.html">codescene.io</a></small>
        </p>
    </section>
    <section>
        <time>16:20</time>
        <h2>Hotspots X-Ray</h2>
        <p>Refactoring of a given unit of code can be approached in a multitude of ways. Adam emphasised that we should never start
            a refactor process without taking into account how the team, as a whole, interact with the identified problematic code.</p>
        <p>Usually, a big refactor might too impactful to be applied straight into the main branch. It implies that we might need to
            branch that modifications out. The risk is clear, if the main branch is modified more frequently than the refactor branch,
            it might never be merged back again.</p>
        <p>Reducing the refactor scope is key to succeed here. The speaker then suggests us to narrow down our problematic code base
            analysis to the function/method level. His ingenious suggestion allow us deliver valuable enhancements into our software
            within days rather than weeks (in case you're refactoring a humungous class) or even years (if we've decided to completely
            overhaul the system).</p>
    </section>
</article>

<div class="footnotes">
  <ol>
    <li id="fn:1">
        <p>Manny Lehman wrote a set of articles between in the 1970s. He would wrap these articles later in 1980 in a book titled "On Understanding Laws, Evolution, and Conservation in the Large-Program Life Cycle". <a href="https://doi.org/10.1016%2F0164-1212%2879%2990022-0">doi:10.1016/0164-1212(79)90022-0</a></p>
    </li>
    <li id="fn:2">
        <p><a href="https://en.wikipedia.org/wiki/Cyclomatic_complexity">Cyclomatic complexity</a> is a software metric used to indicate the complexity of a program. It is a quantitative measure of the number of linearly independent paths through a program's source code. It was developed by Thomas J. McCabe, Sr. in 1976.</p>
    </li>
    <li id="fn:3">
        <p>Code Change Frequency is a measure to identify files that has been more frequently changed. If you are curious
            to learn how you can address this, you can check out this <a href="https://github.com/bcarlso/defect-density-heatmap">
            really interesting repository</a>.</p>
    </li>
    
  </ol>
</div>