---
title: 安装pod

categories:
  - CocoaPods
tags:
  - 随笔
comments: true
---


<!-- more -->
gem -v

gem source -r https://rubygems.org/

gem source -ahttps://gems.ruby-china.com/

gem source -l

sudo gem install -n /usr/local/bin cocoapods --pre

pod setup

pod --version