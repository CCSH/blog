---
title: Mac 安装pod
categories:
  - 随笔
tags:
  - 操作
comments: true
---


Mac 安装pod
<!-- more -->
```
安装pod 

需要安装Xcode

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm -v

rvm install 2.6

//xcode-select --install

rvm use 2.6.0 --default

ruby -v

gem -v

gem source -r [https://rubygems.org/](https://rubygems.org/)

gem source -[ahttps://gems.ruby-china.com/](ahttps://gems.ruby-china.com/)

gem source -l

sudo gem install -n /usr/local/bin cocoapods --pre

pod setup

//快速安装与更新
--verbose --no-repo-update
```