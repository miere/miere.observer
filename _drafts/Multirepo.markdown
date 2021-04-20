---
layout: post
title:  "Multiple repositories to rule them all?"
categories: [engineering]
tags: [engineering]
---

## The Problem
If your software is getting bigger, than your application may have one of the following behaviors:
* A shared piece of code
* A shared library
* A shared service

If your software is complex though, you may also have:
* Different programming languages - the best tool for that job
* Different tool set for different programming languages

Either way you need:
* To automatically discovery new entries on your 

## Pros of multirepo
* Lower learning curve to understand a new micro-service
* Easy to grasp the _whole picture_ as developers are introduced to one part of the software at the time
* Easy to setup different deployment rules
* Easy to enforce permissioning
* Lower build time
* Easy to include a new micro-service
* Less overhead to your IDE
* It welcomes different languages and toolset in your development ecosystem

## Cons of multirepo
* Hard and complicated initial setup
* Easy to maintain the pipeline, hard to share the knowledge with another DevOps/Software Architect

![das](https://cdn-images-1.medium.com/max/1024/1*9cSnqslLV76gOoxaFhW6Qg.png)


