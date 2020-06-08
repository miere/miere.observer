---
layout: post
title:  "The Big Ball of Mud - Serverless Edition"
subtitle: "How we have turned something that should make our lives easier into something that is dreadful hard to maintain in the long run."
categories: [engineering]
tags: [engineering, anti-patterns, serverless]
header-img: 'https://res.cloudinary.com/practicaldev/image/fetch/s--gOcSeHXc--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://www.synthesis.co.za/wp-content/uploads/bfi_thumb/AgileArchitecture1-1rl3zo5ig9008zq8zgwie6cn9vnbl7um76y52b72jvbo.jpeg'
---
A few days ago I reviewed Eric Johnson's talk named [Thinking Asynchronously]({{ '/engineering/2020/06/05/Analisys-Thinking-Asynchronously.html' | relative_url }}). The idea behind this talk is to increase reliability and integrity by using less code and think asynchronously to persist data first whenever possible. In fact, a smaller code base is less error prone and makes easier to monitor and debug. If we deconstruct all of his ideas as principles - or techniques - then we have a brilliant toolkit to use to help us solve complex problem.

But despite my enthusiasm, I'd like use one of his slides to outline something that is usually neglected in serverless architecture: complexity.

<p class="image"><img src="{{ '/imgs/thinking-async-big-ball-of-mud-serverless-edition.png' | relative_url }}"> <small>Picture taken from the last slide of <a href="{{ '/engineering/2020/06/05/Analisys-Thinking-Asynchronously.html' | relative_url }}">Eric Johnson presentation</a></small></p>

## Infrastructure as a Code
The above diagram is complex by itself, and this is just a representation of a single HTTP request among others that might exist in a given API. Assuming this is a real world software, it is unlikely there will ever be have a junior or mid-level developer in the team who maintain it. We should be aware that by introducing extra components in our architecture we are also making it more complex and that might not be suitable for all sizes of teams.

An alternative to overcame this would be using <a href="https://www.hashicorp.com/resources/what-is-infrastructure-as-code/">Infrastructure as a Code</a>. Developers of all types might take advantage of a well written piece of code that eloquently describes its infrastructure and allows one to makes tests on a similar replica of production to ensure that changes  Sadly, our ecosystem is not there yet. Terraform, the best tool for that so far, i




[^1]: [ClaudiaJS](https://www.claudiajs.com/) (that has been in the market for a few years already), [Ibratan's Lambdify](https://github.com/lambdify/lambdify-core) (in maintenance mode) and [APEX](https://github.com/apex/apex) (not maintained anymore) provides seamless integration with AWS Lambda API abstracting the complexity away from developers. They also provide basic error handling out-of-box - which means we don't need to repeat ourselves for that.