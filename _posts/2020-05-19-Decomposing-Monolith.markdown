---
layout: post
title:  "Decomposing a Monolith"
categories: [engineering]
tags: [engineering, information architecture, cost management]
---

<header class="briefing">
<div class="video"><iframe class="video" src="https://www.youtube-nocookie.com/embed/9I9GdSQ1bbM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
<p>This a transcription of (although sometimes I have included comments about) the best points of a talk that <a href="https://samnewman.io/">Sam Newman</a> has presented in the 2019 GOTO Conference, Berlin edition. There were several points on his presentation that, I think, were spot on and deserves to be transcribed and better explained. There is a bit of a debate about whether or not to start from a Monolith and then move to a Microservice Architecture. Understanding how <i>decomposing monolith</i> might not only shed a light on this but also made us understand the benefits of doing it gradually.</p>
</header>

<article class="timeline">
    <section>
        <time>2:40</time>
        <h2>Monolith</h2>
        <p>Sam emphasises that Monolith Service is not the same as a Legacy System. In practice, they differ substantially and we need to observe them differently so we can deliver a better solution to our managers and customers.</p>
    </section>
    <section>
        <time>4:16</time>
        <h2>Modular Monolith Deployment</h2>
        <p>After introducing the basic concept of a Monolith, Newman quickly discusses Modular Monolith deployment. Architecture wise, its components are internally split into modules (depending on the language you use it can simply be packages, namespaces or libraries). These modules are using run on the same process and its persistence layer is usually centralized in a single database instance.</p>
        <p>He believes <i>this is, in theory, a good scenario to be, as these modules can be easily split into smaller services later</i>, reducing the effort to transition the service into a microservice. "Most people are better of in a modular monolith deployment" than in a microservice architecture - as he will discuss later.</p>
    </section>
    <section>
        <time>7:14</time>
        <h2>Third-party Monolith</h2>
        <p>Newman describes a third-party monolith as everything "that is completely out of your control", something you can't change its internal behaviour. It might be your CRM software that your SaaS application relies on or even that old piece of software which you don't have the source code.</p>
    </section>
    <section>
        <time>8:01</time>
        <h2>Distributed Monolith</h2>
        <p>Distributed Monolith differs from a simple monolith by having its functionalities are split across different services, using the network to communicate with each other. Because of how we split our system apart, or even due to different reasons, we often end up having pieces of code being changed across module boundaries.</p>
        <p>It is, arguably, the worst scenario you can be as the team who maintains it will have all the challenges a distributed system has along with the downsides of a monolith. It introduces a high cost to change functionalities, larger-scoped deployments and requires higher co-ordination activities - as you have more things that might go wrong.</p>
    </section>
    <section>
        <time>10:20</time>
        <blockquote>
            <p>Fundamentally, you have to accept that monolith isn't necessarily the enemy - it's extremely rare that your goal is to kill the monolith. It sometimes happens but, most of the time, you're in a situation where you're trying to achieve something as a business but your current architecture won't let you achieve that goal.</p>
        </blockquote>
        <p>This is an important bit from his presentation and it needs to be transcribed as is. A Monolith Service by itself is not a bad thing and, like any other architectural decision, it has its pros and cons. We should only switch from a monolith to a microservice architecture when its benefits overcome the cost of maintaining a complex distributed system.</p>
    </section>
    <section>
        <time>12:44</time>
        <blockquote>
            <p>You won't appreciate the true horror, pain and suffering of microservices until you're running then in production.</p>
        </blockquote>
        <p>Perhaps a good start might be extracting one module from your Modular Monolith into an external service. What you learn from observing this new service might give you enough insights to continue with the transition from a monolith to a microservice architecture.</p>
    </section>
    <section>
        <time>15:15</time>
        <h2>Strangler Fig Pattern</h2>
        <p>At this point in his presentation, Sam cut the chase and started to present solutions (architectural patterns) that will help us to decompose a monolith service. Strangler Fig is a pattern in which you wrap new functionalities around the existing ones in a way that the existing solution is not changed or is aware of it. In practical terms, he suggests us introduce an HTTP Proxy to intercept calls to the existing service diverting the calls to the new one as well.</p>
        <p>The <b>Strangler Fit Pattern fits perfectly when we are at the beginning of the transition to a microservice or when dealing with Third-Party Monoliths</b>, as other components of our existing solution still depend on the data managed by the one which will be replaced. The original component tables will still be fed with new data, giving us time to rethink or redesign other components in the future.</p>
    </section>
    <section>
        <time>22:04</time>
        <h2>Branch By Abstraction</h2>
        <p>Although his explanation about this pattern was good enough for a presentation in front of a big audience, I reckon his own definition (taken from <a href="https://samnewman.io/patterns/architectural/branch-by-abstraction/">his blog</a>) wraps it up perfectly.</p>
        <blockquote>
            <p>When making a significant change to how a piece of functionality is implemented, the challenge is how to work on this reimplementation over a period of time. With branch-by-abstraction, you create a single abstraction point over the functionality to be reimplemented, allowing both the existing functionality and the new implementation to co-exist inside the same running process at the same time.</p>
        </blockquote>
        <p>At this point in his presentation, he started to describe the ideal step-by-step to implement this pattern. I've modified it slightly to make it easier to reproduce.</p>
        <ol>
            <li><b>Isolate the current implementation</b> - This is the first and most important and delicate step of this pattern, where you isolate the current implementation from the rest of the service. At this step you have to move the logic of the current functionality you intend to replace and move it to a single place (same package, module or folder).</li>
            <li><b>Create an abstraction point</b> - Create an interface that will behave as the contract to call that given functionality. With the <a href=https://en.wikipedia.org/wiki/Behavioral_subtyping#%22Substitutability%22">Liskov Substitution Principle</a> in mind, you must make sure your software calls a default implementation of this internal, which will call your just isolated functionality.</li>
            <li><b>Start working on the new service implementation</b> - Once you finish, the new service will be later called by the monolith via HTTP (assuming that you exposed the new functionality through a Web API) and the web client should be wrapped in an alternative implementation of the just created interface.</li>
            <li><b>Switch over when it is ready to release</b> - </li>
            <li><b>Clean up</b> - Observe production and gather data to assess the results. A rollback is still possible at this point, allowing you to revisit the implementation until everything is working perfectly. Once everything is working as expected, you can remove the old functionality from your codebase.</li>
        </ol>
    </section>
    <section>
        <time>26:07</time>
        <h2>Parallel Run</h2>
        <p>Being a variation of Branch by Abstraction, Parallel Run allows both implementations to co-exist at the same time. This is particularly useful to check if the behaviour has changed. Although both branches have different implementations it's expected that they to behave the same way, unless otherwise noted. Therefore, when comparing the outcome of both functionalities, it's important to take the original implementation as the source of truth, where any discrepancy in the result comparison between them should be considered a failure in the new service.</p>
    </section>
    <section>
        <time>28:10</time>
        <h2>Accessing the Data</h2>
        <p>Entering in the last stage of his talk, Sam finally addresses what he describes as the hardest topic when decomposing a monolith: how to organize and access the data on from/on the just created service. On his conception, on the evolutionary point of view, the data migration should be comprised by the following steps.</p>
        <ol>
            <li><b>Temporarily reuse the existing functionality database</b> - Direct communication between the new service and the existing database would be allowed in as a temporary measure to stabilize the new functionality. Treating this as a permanent solution, though, might be the beginning of a new distributed monolith due to how tightly coupled both services became.</li>
            <li><b>Expose the existing data via API</b> - This solution is intended to reduce, but not remove, the coupling between both services. It gives developers more flexibility to react to possible changes that might happen in the database schema. He encourages us, though, to revisit the way information is consumed or ingested to avoid cyclic dependencies between both services - a common antipattern found in distributed monoliths.</li>
            <li><b>Move the data to the new service</b> - Turning the new service into the source of truth is the definitive move to finish the migration from monolith to a microservice architecture. It comes with its challenges though. Joins between tables have to be rethought, split tables might be necessary and referential integrity provided by the database layer is completely off the table.</li>
        </ol>
    </section>
</article>

<h2>Takeaways from talk</h2>
Newman did a brilliant job outlining the tradeoffs of prematurely adopting Microservice Architecture and I reckon there's richness on his speech when he describes the dreadful consequences when we mistakenly end up creating a Distributed Monolith. Tackling the issues it introduces leads us to [introduce new hacks in our architecture and deployment pipeline](https://github.com/korfuri/awesome-monorepo), like monorepo or shared modules between services. As Microservices are independently deployable - and generally speaking share no source code between them - our CI/CD is actually simpler. It is a good balance between cost and delivered value to our stakeholders.

By reading between the lines we can also notice how much he is concerned about monitoring the runtime environment and tackle unexpected issues at early stages of its deployments. Due to the complexity of distributed systems, handling network and hardware issues before the business requirements make the software complex would save us several hours of development.