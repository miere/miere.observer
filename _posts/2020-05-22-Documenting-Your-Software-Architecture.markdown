---
layout: post
title:  "Documenting Your Software Architecture"
categories: [engineering]
tags: [engineering]
---
In the 2000s we went from documenting every single class of our software to not at all. It was an attempt to increase the delivery pace, keeping the team away from tasks that, eventually, have to be remade once the software changes. As a side effect, scaling the team became a problem. The most notable one is the lack of autonomy from its members. Not only newcomers need special attention to get familiarized with the basics of their software (like building and running it), but they would still ask several questions until they understand how it works and how it solves the problem it was designed for.

It is a known fact that designing new software requires meticulous planning, strict alignment between team members and keep them focused on the defined goal. Reducing the scope of your documentation to the software architecture might be a good starting point, as you probably don't need to document every single class of your software to give them enough direction when they are coding. It relieves teams from frequently asked questions and forcing its members to stick with previous definitions unless a big change is necessary, and will let them focus on the business side of their projects.

Unlike the lack of autonomy, lack of accountability plays a non-neglectable indirect impact on team performance. Let us assume that in a Software Development team we are going to face only three types of issues: bugs, business-related issues and architecture issues. While Developers are accountable for solving bugs, and Product Owners for business-related issues, even on teams where there's a dedicated Software Architect nobody responds for the architectural problems the team faces. On first glance, it seems unfair to blame him for a problem that was introduced collectively by a multitude of reasons that happened together.

In reality, once the team starts documenting their learnings and architectural decisions they will become more accountable from their architectural decisions. By being fully aware of the technical decisions made in the past and understanding the expected positive outcome it introduced, teams can be accountable for architecture issues on the software, erasing the grey zone between Architecture Decisions and Business Decisions.

## Documenting for your different audiences
Documentation is a tool to transfer knowledge, to keep the team on the same page regarding **what problem the software solves, how those problems were solved, what were the technical decisions that should be followed widely during the development, and how one can run the software and see it in action**. Having long essays written in an MS Word document or a Wiki page is not enough to efficiently convey the information to the team members.

On [his talk](https://youtu.be/x2-rSnhpw0g) Visualising The Software Architecture, [Simon Brown](https://simonbrown.je/) stressed that "as your software have different audiences with different needs". He means that you need different tools to cover how the different layers of our software work. Thus, along with his iconic C4Model - which will be discussed later - I have adopted a couple of simple-yet-powerful guidelines that helped me to contextualize whoever is maintaining our source code.

## The Source Code Guideline
For the sake of productivity, the documentation should be started with the Source Code Guideline, which covers the basics concepts a developer might need to understand how the project source code is structured. A basic version of this document should answer the following questions a developer might have - although it can be enhanced with more topics whenever needed:

- How to run the software locally?
- How to run all automated tests locally?
- How to package the software?
- How to deploy the software?
- How to edit the software?

Bear in mind that long lists of commands can lead to reproducibility issues. So try to keep it as neat as possible, [automating it before documenting it](https://miere.observer/engineering/2020/04/20/Producing-professional-deliverables.html#going-beyond-kents-simple-design).

<blockquote class="note">
<a href="https://gist.github.com/miere/cba07143f3f37c64fc0fa82a8e9179a6">Here</a> you can find a sample document that answers these questions with topics, making them easy to read.
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
<a href="https://gist.github.com/miere/bcd10534a0c26f30b7e6d5234c4e903e">Here</a> you can find a sample document that exemplifies how it can be composed. This one, though, is a bit denser than the previous one as it was based on a previously written document taken from a previous customer.
</blockquote>

## The C4Model
C4Model is probably the most pragmatic documentation model I've come across. Simon came with the idea to represent the different layers of software with diagrams. When he conceived it, he wanted us to experience a model that worked like maps: by zooming out you get more context you dive into more details, but when you zoom out to better understand in which context the software is running on.  According to the way he conceives it, any software can be described in four main layers, each of which is represented by one diagram:

- **System Context Diagram** - Shows the software in question in the centre, identifying who works with it and what it depends on.
- **Containers Diagram** - Illustrates the overall shape of the architecture and a few technology choices.
- **Components Diagram** - Explains the logical components and their interactions within the component.
- **Code Diagrams** - Explains component implementations in detail.

The first three diagrams are his creations, all of which adopts simplistic notations to demonstrate how a particular piece of the system is working. Code Diagrams, on the other hand, are basically UML and he discourages us to adopt them as they tend to become outdated quite frequently. It is there in the case you have a specific need where documenting the source code itself is mandatory task.

C4Model is [well documented on its website](https://c4model.com/), with several years spent polishing it to reach this level of simplicity and organization. The beauty behind these diagrams lies in the fact we can pick our target audience, allowing us to choose when and who should be involved in the documentation process.
