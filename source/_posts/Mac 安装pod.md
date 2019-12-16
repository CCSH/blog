---
title: Mac 安装pod
categories:
  - 随笔
tags:
  - 操作
comments: true
---

Mac 安装 pod

<!-- more -->

```
需要安装Xcode
gem -v

gem source -r https://rubygems.org/

gem source -a https://gems.ruby-china.com/

gem source -l

sudo gem install -n /usr/local/bin cocoapods --pre

pod setup

pod --version


//快速安装与更新
--verbose --no-repo-update
```
