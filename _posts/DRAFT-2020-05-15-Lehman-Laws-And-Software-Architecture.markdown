---
layout: post
title:  "Lehman Laws and The Software Architecture"
categories: [engineering]
tags: [engineering, information architecture, cost management]
---
Start simple, make it complex when needed. That seems to be the most cost-effective approach to design a software from scratch nowadays, although not always feasible to put in practice. Let's try to cover why this happen and how the so called Lehman Laws of Software Evolution can give us some special hints on to tackle it.

## Information Architecture Matters
- We spend little time understanding how the information we hold will be approached by our users by the UI
- Drawing diagrams simulating how it might work, or even [CRC Cards](http://wiki.c2.com/?CrcCard), is useful to understand the whole picture
- Biggest problem lies on the fact we've been trained to design our services based on entities
- The increasing coupling between entities might introduce even harder relationship them, introducing unwanted issues like code fragility. So called Big Ball of Mud?

## Lehman Laws as for 2006
- 
In 2006 Lehman, along with Fernández-Ramil, 