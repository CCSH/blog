---
title: VSCode 配置
categories:
  - VSCode
tags:
  - 配置
comments: true
---


VSCode 配置
<!-- more -->
```
{
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,
  "javascript.updateImportsOnFileMove.enabled": "always",
  "workbench.statusBar.feedback.visible": false,
  "workbench.settings.editor": "json",
  "emmet.includeLanguages": {
    "javascript": "javascriptreact"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  // tab间隔
  "editor.tabSize": 2,
  "editor.wordWrapColumn": 100,
  // #每次保存的时候自动格式化
  "editor.formatOnSave": true,
  // 每次保存的时候将代码按eslint格式进行修复
  "eslint.autoFixOnSave": true,
  // 开启 eslint 支持
  "prettier.eslintIntegration": true,
  // 使用单引号
  "prettier.singleQuote": true,
  // 结尾不加分号
  "prettier.semi": false,
  // 尾随逗号
  // "prettier.trailingComma": "all",
  // 代码补全
  "editor.quickSuggestions": {
    "other": true,
    "comments": true,
    "strings": true
  },
  // vue格式化
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    {
      "language": "vue",
      "autoFix": true
    }
  ],
  "workbench.colorTheme": "Visual Studio Dark",
  "workbench.iconTheme": "vscode-icons-mac"
  //代码自动换行
  "editor.wordWrap": "on"
}
```
插件
```
Auto Rename Tag
Bracket Pair Colorizer
Chinese (Simplified) Language Pack for Visual Studio Code
ESLint
Path Intellisense
Prettier - Code formatter
Project Manager
vscode-icons-mac
Vetur
```
![image.png](https://upload-images.jianshu.io/upload_images/1897259-c64b07d64dc1cbf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
