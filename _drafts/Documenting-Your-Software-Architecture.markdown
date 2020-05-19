---
layout: post
title:  "Documenting Your Software Architecture"
categories: [engineering]
tags: [engineering]
---

In the 2000s we went from documenting every single class of our software to not at all. It was an attempt to increase the delivery pace, keeping the team away from tasks that, eventually, have to be remade once the software changes. As a side effect, scaling the team became a problem. Not only newcomers need special attention to get familiarized with the basics of their software (like building and running it), but they would still ask several questions until they understand how it works and how it solves the problem it was designed for.

It is a known fact that designing new software requires meticulous planning, strict alignment between team members and keep them focused on the defined goal. Reducing the scope of your documentation to the software architecture might be a good starting point, as you probably don't need to document every single class of your software to give them enough direction when they are coding. It relieves teams from frequently asked questions and forcing its members to stick with previous definitions unless a big change is necessary, and will let them focus on the business side of their projects.

## The Pillars of a Software Architecture Documentation
Perhaps it's [academically accepted](https://web.archive.org/web/20200410222638/https://en.wikipedia.org/wiki/Software_architecture) to refer to Software Architecture as "the fundamental structures of a software system and the discipline of creating such structures and systems". But it doesn't make clear what was behind the decisions taken and the context that led to them. It is important to keep the team aware of **what problem the software solves, what were the technical decisions that should be followed widely during the development, and how one can run the software and see it in action**.

Essentially, it brings a matter of accountability, or fairness if you will. Being fully aware of the technical decisions made in the past, and understanding the expected positive outcome it introduced, teams can be accountable for architecture issues on the software, erasing the grey zone between Architecture Decisions and Business Decisions.

Once documented, these answers will be eternized in a few, but simple, documents. They can be shared between projects, as small teams tend to adopt the same techniques to keep their lives simpler, and the big ones tend to exchange previously learned lessons more often. However, if your services have different natures or don't share enough similarities, you should compose one document per service as well. Otherwise, your documents will become cluttered and hard to digest.

## The Source Code Guideline
For the sake of productivity, the documentation should be started with the Source Code Guideline, which covers the basics concepts a developer might need to understand how the project source code is structured. A basic version of this document should answer the following questions a developer might have - although it can be enhanced with more topics whenever needed:

- How to run the software locally?
- How to run all automated tests locally?
- How to package the software?
- How to deploy the software?
- How to edit the software?

Bear in mind that long lists of commands can lead to reproducibility issues. So try to keep it as neat as possible, [automating it before documenting it](https://miere.observer/engineering/2020/04/20/Producing-professional-deliverables.html#going-beyond-kents-simple-design).

<blockquote class="note">
<a href="https://gist.github.com/miere/cba07143f3f37c64fc0fa82a8e9179a6">Here</a> you can find a sample document that answers these questions as topics, making them easy to read.
</blockquote>

## The Architecture Decisions Guideline
Next comes the Architecture Decisions Guideline, which complies of everything that might affect the daily routine of any contributor to your software. It should be straightforward and concise, not only pointing the exact direction one has to follow to contribute to the software, but also introducing them lessons learnt from the past and decision taken to avoid possible issues. It may contain:

- An analytical list of problems, techniques and methodologies that should be avoided on the project.
- A detailed process of how issues should be fixed and how new features should be introduced in the software. Make sure to state the tools involved in this process - e.g. Git branches.
- A brief explanation of how new releases are rolled out to production.
- An explanation of how quality is enforced before a release is closed.
- What coding principles shall be applied otherwise the proposed modifications might be denied.

When to compose this document is a complex topic. Synergic teams are constantly aligned and might be on the same page right from the conception of the software, which would allow the team to postpone the document creation to a future moment. It's desirable, though, to have it finished once the first stable version of the software is released. Its existence will be the backbone of any code review that might happen in the future. It will ensure that the quality the code base achieved will last long enough so developers can move to the next project with peace of mind.

<blockquote class="note">
<a href="https://gist.github.com/miere/bcd10534a0c26f30b7e6d5234c4e903e">Here</a> you can find a sample document that exemplifies how it can be composed. No rocket science there, although this one is a bit more dense as it was based on a previously written document taken from a previous customer.
</blockquote>






