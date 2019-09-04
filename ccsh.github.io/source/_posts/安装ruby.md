---
title: 安装ruby
categories:
  - ruby
tags:
  - 随笔
comments: true
---


<!-- more -->
curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm -v

rvm install 2.6

rvm use ruby-2.6.3 --default

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"