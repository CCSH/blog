---
title: iOS Pod 问题 
categories:
  - iOS
tags:
  - 问题
comments: true
---


# 突然出现 -bash: pod: command not found 的解决方法
<!-- more -->
```
$ mkdir -p $HOME/Software/ruby
$ export GEM_HOME=$HOME/Software/ruby
$ gem install cocoapods
$ export PATH=$PATH:$HOME/Software/ruby/bin
$ pod --version
```