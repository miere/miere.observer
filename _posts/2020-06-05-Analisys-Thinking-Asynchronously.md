---
layout: timeline-post
title:  "Analysis: Thinking Asynchronously"
subtitle: "An opinionated transcription of Eric Johnson's talk Thinking Asynchronously"
categories: [engineering]
tags: [engineering, master]
header-img: 'https://i.ytimg.com/vi/V_tHVUHKqZQ/maxresdefault.jpg'
---

<header class="briefing">
<div class="video">
<iframe class="video" id="youtube-video"
    src="https://www.youtube.com/embed/V_tHVUHKqZQ?enablejsapi=1&modestbranding=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
<p>This is an opinionated transcription of <a href="https://twitter.com/edjgeek">Eric Johnson's</a> talk <b>Thinking Asynchronously</b>. He has presented in the 2020 GOTO Conference, online edition because of COVID pandemic. His straightforward presentation approach guides us through steps that take advantage of asynchronous persistence pipelines to provide a better experience to our users. It is a great opportunity for newcomers to understand where AWS want to achieve with serverless from know on. I took the opportunity to elaborate more on a few services used by him on his talk to give more context.</p>
</header>

<article class="timeline">
    <section>
        <time>2:45</time>
        <h2>Common Serverless Pattern</h2>
        <p>Usual serverless application will mimic the typical three-tier architecture. API layer will, as naturally happens, be responsible for Security and Routing, while compute layer will have anything else you need to persist your data into the storage layer. On Eric's perspective this comes with a concerning trade-off: if something goes wrong it will probably fail on your code as it is most vulnerable building block of your architecture.</p>
    </section>
    <section>
        <time>5:24</time>
        <h2>Thinking Asynchronously</h2>
        <p>Eric proposes that we persist the data before we apply any computation to that. It brings us a few major benefit from the traditional approach:</p>
        <ul>
            <li><b>Greater reliability</b>. In case of failure in our codebase, we have our data persisted already.</li>
            <li><b>Faster response times</b> in our APIs. By moving the extra computation to a second step, the user already received the feedback in the UI.</li>
            <li><b>We can do more in less apparent time to the client</b>. As the complex computing is now the last thing to do, our persistence pipeline has bigger room to process data with no apparent impact on user's experience.</li>
        </ul>
        <p>One might argue that you can squish bits and bytes of your code to provide a similar result. Perhaps the pillars from Eric's approach lies on how it increases the flexibility by reducing the response time on the API side. After all, it's an old known fact that <a href="https://www.nngroup.com/articles/response-times-3-important-limits/">better response times implies better user experience</a>.</p>
    </section>
    <section>
        <time>10:14</time>
        <blockquote>
            <p>Well, we talk about serverless we look at "what is serverless?" and basically I meant serverless is: <b>something happens, we react and do something.</b></p>
        </blockquote>
    </section>
    <section>
        <time>10:45</time>
        <h2>Event Driven Patterns</h2>
        <p>Event Driven Development is the key to make the suggested approach work. AWS-wise, there's a <a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-services.html">multitude of events that can you can listen to</a> with a AWS Lambda function. Of course, you can also take advantage of AWS network services like SNS, SQS and Kinesis to consume asynchronous events on your Docker container or application instance.</p>
    </section>
    <section>
        <time>12:06</time>
        <h2>Amazon API Gateway</h2>
        <p>I'd like to draw your attention to this versatile service available in AWS, and the idea behind its conception. API Gateway was first <a href="https://aws.amazon.com/about-aws/whats-new/2015/07/introducing-amazon-api-gateway/">introduced in 2015</a>, it communicates directly with 100+ AWS Services, allowing you to transform requests and response payloads with Apache Velocity templating language (VTL). It's commonly used as serverless Rest API, allowing developers to configure HTTP routes in a higher level abstraction in which you don't have to provision resources to handle the request - matching Eric's personal definition of serverless. Requests received by the API Gateway are translated into events, allowing you to listen it directly to any compatible AWS service, like DynamoDB or Lambda.</p>
        <p>API Gateway is also <a href="https://microservices.io/patterns/apigateway.html">a well known pattern</a>. A few years ago, Netflix OSS team <a href="https://netflixtechblog.com/embracing-the-differences-inside-the-netflix-api-redesign-15fd8b3dc49d">introduced their own API Gateway solution</a>. It was designed with a few key philosophies in mind, "each of which is", in their words, "instrumental in the design of our new system":</p>
        <ul>
            <li>Embrace the Differences of the Devices</li>
            <li>Separate Content Gathering from Content Formatting/Delivery</li>
            <li>Redefine the Border Between “Client” and “Server”</li>
            <li>Distribute Innovation</li>
        </ul>
        <p>In fact, the problem it solves is wide known between teams handling large fleet of microservices. GraphQL, for instance, approaches these problems from a different perspective, and <a href="https://en.wikipedia.org/wiki/GraphQL">has been in internal use on Facebook since 2012 as well</a>. Since Netflix blog post, several other approaches have been designed at an alternative for the custom brewed API Gateway solution. <a href="https://www.krakend.io/">Krakend</a> is a fairly popular and feature rich stateless API Gateway - might be a good tool for <a href="https://serverless-training.com/articles/save-money-by-replacing-api-gateway-with-application-load-balancer/">those situations where the cost AWS API Gateway is an issue</a>.</p>
    </section>
    <section>
        <time>12:06</time>
        <h2>Amazon DynamoDB</h2>
        <p>DynamoDB is an underrated, fascinating <a href="https://www.techopedia.com/definition/29431/database-as-a-service-dbaas">database service</a>. The description on its website doesn't make justice to its capabilities: <sup><a href="#fn:1" class="footnote">1</a></sup>
        </p>
        <ul>
            <li><b>Key-value data store</b> - It fits perfectly as a persistence layer for tasks that requires intensive write throughput - being especially good for timeseries data or document persistence.</li>
            <li><b>Expirable entries</b> - You can define a Time To Live (TTL) value to arbitrary expire entries on your tables.</li>
            <li><b>Global tables</b> - DynamoDB can manage tables accessible (replicated) globally.</li>
            <li><b>In-memory Acceleration with DAX</b> - It acts as a mix of near cache and table space for ly accessed data. Pricey, but might worth it if you take into account the cost of maintaining such a mechanism by your self.</li>
        </ul>
        <p>Surely, DynamoDB's <a href="https://aws.amazon.com/dynamodb/">feature list</a> is more extensive than that. But the ones above mentioned are ingredients for a multitude of scalable recipes for problems you might face on your daily routine. From <i>The Poor Man's <a href="https://microservices.io/patterns/data/event-sourcing.html">Event Sourcing</a> Tool</i> <sup><a href="#fn:2" class="footnote">2</a></sup> to a <i>Globally Distributed Ordered Queue</i>, it is the kind of Swiss Knife you want to have on your toolbox when you have a complex situation to tackle. You can even create <a href="https://medium.com/swlh/scheduling-irregular-aws-lambda-executions-through-dynamodb-ttl-attributes-acd397dfbad9">your ad-hoc scheduling mechanism</a>, allowing you "to schedule an irregular point of time execution of a lambda execution without abusing CloudWatch crons".</p>
        <p>Inevitably, its simple key-value design introduces trade-offs: indexing is quite limited, you can't join tables and you will probably spend a bit of time trying to fine-tuning it for an optimal cost its read and write provisioning <sup><a href="#fn:3" class="footnote">3</a></sup>. But its flexibility and simple API, along with thoughtfully designed persistence tables, might be an elegant and affordable solution for your company.</p>
    </section>
    <section>
        <time>14:20</time>
        <h2>Other "storage first" options</h2>
        <ul>
            <li><a href="https://aws.amazon.com/kinesis/">Amazon Kinesis</a></li>
            <li><a href="https://aws.amazon.com/s3/">Amazon Simple Storage Service (S3)</a></li>
            <li><a href="https://aws.amazon.com/sqs/">Amazon Simple Queue Service (SQS)</a></li>
        </ul>
    </section>
    <section>
        <time>24:28</time>
        <h2>Amazon EventBridge</h2>
        <p>This is another obscure but intriguing service available in the AWS portfolio. EventBridge is more than <a href="https://books.google.com.au/books?id=qR0hDgAAQBAJ&pg=PA54&lpg=PA54&dq=old-fashion+service+bus&source=bl&ots=ngRwK-Xg27&sig=ACfU3U34CuRKeKawirqsgr5YT-pRQwFCnw&hl=en&sa=X&ved=2ahUKEwjam8Sov-_pAhUX4jgGHYhdCKcQ6AEwCXoECAoQAQ#v=onepage&q=old-fashion%20service%20bus&f=false">an old-fashion Service Bus</a>, but a blistering fast <a href="https://en.wikipedia.org/wiki/Decision_tree">decision tree</a> capable to translate inputs into actions. It can connect with, basically, everything from AWS Lambda and AWS Step Functions to AWS Kinesis and AWS SQS. You even use AWS SNS to trigger a further HTTP request to an external service.</p>
    </section>
    <section>
        <time>31:03</time>
        <h2>Lambda Destinations</h2>
        <blockquote>
        <p>With Destinations, you can route asynchronous function results as an execution record to a destination resource without writing additional code. An execution record contains details about the request and response in JSON format including version, timestamp, request context, request payload, response context, and response payload. For each execution status such as Success or Failure you can choose one of four destinations: another Lambda function, SNS, SQS, or EventBridge. Lambda can also be configured to route different execution results to different destinations.</p>
        <footer>
            <cite>As we've reached the apex of this talk, Eric was so excited that his explanation was a bit disastrous <sup><a href="#fn:4" class="footnote">4</a></sup>, so I decided to quote an <a href="https://aws.amazon.com/blogs/compute/introducing-aws-lambda-destinations/">AWS Blog post about Destinations</a> instead.</cite>
        </footer>
        </blockquote>
    </section>
</article>



<div class="footnotes">
  <ol>
    <li id="fn:1">
        <p>"A fully managed proprietary NoSQL database service that supports key-value and document data structures. DynamoDB can handle more than 10 trillion requests per day and can support peaks of more than 20 million requests per second" - as was seen in the <a href="https://aws.amazon.com/dynamodb/">Amazon DynamoDB</a> description page - 05/Jun/2020.</p>
    </li>
    <li id="fn:2">
        <p>Depending on how you design your tables, TTL and stream listeners, it might be cheaper than spinning up and maintaining a Kafka cluster.</p>
    </li>
    <li id="fn:3">
        <p>The pricing model is not the same pay-as-go that you find on most of AWS services, instead of paying for requests you pay for the provisioned read and write capabilities of your tables. It's true that, a long time ago, Amazon introduced auto-scaling capabilities for table provisioning, but still you have to keep its pricing model in mind otherwise you might run out of budget.</p>
    </li>
    <li id="fn:4">
        <p>Eric's explanation about Lambda Destination: "There is this really cool thing we announced last Re:Invent called Lambda Destinations. And the way this works is I can run a function and if it is successful than I can just trigger some data into EventBridge, Lambda SNS or SQS. Or if it is on fail, I can then trigger data into the same data."</p>
    </li>
  </ol>
</div>
