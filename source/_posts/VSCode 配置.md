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
  "emmet.includeLanguages": {
    "javascript": "javascriptreact"
  },
  //格式化工具
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  // 设置样式
  "workbench.settings.editor": "json",
  // 控制资源管理器是否在把文件删除到废纸篓时进行确认
  "explorer.confirmDelete": false,
  // 控制在资源管理器内拖放移动文件或文件夹时是否进行确认
  "explorer.confirmDragAndDrop": false,
  // 自动更新路径
  "javascript.updateImportsOnFileMove.enabled": "always",
  // 主题
  "workbench.colorTheme": "Visual Studio Dark",
  //字体
  "editor.fontFamily": "'Cascadia Code','Microsoft Yahei',Menlo, Monaco, 'Courier New', monospace",
  // 自动换行
  "editor.wordWrap": "on",
  "editor.wordWrapColumn": 100,
  // tab间隔
  "editor.tabSize": 2,
  // 每次保存的时候自动格式化
  "editor.formatOnSave": true,
  // 代码补全
  "editor.quickSuggestions": {
    "other": true,
    "comments": true,
    "strings": true
  },
  "code-runner.runInTerminal": true,
  // 每次保存的时候将代码按eslint格式进行修复
  "eslint.autoFixOnSave": true,
  //---> Prettier - Code formatter 代码格式化
  // 使用单引号
  "prettier.singleQuote": true,
  // 结尾不加分号
  "prettier.semi": false,
  // 尾随逗号
  "prettier.trailingComma": "all",
  //---<
  //---> koroFileHeader
  "fileheader.configObj": {
    "autoAdd": false, // 自动添加头部注释开启才能自动添加
    "autoAlready": true, // 默认开启
    "language": {
      "dart": {
        "head": "/// MARK:",
        "middle": "//  @",
        "end": "//  备注 "
      },
    },
  },
  // 头部注释
  "fileheader.customMade": {
    "Description": "类描述",
    "Author": "陈胜辉",
    "Date": "Do not edit", // 文件创建时间(不变)
    "Version": "版本号, YYYY-MM-DD",
    "LastEditors": "陈胜辉", // 文件最后编辑者
    "LastEditTime": "Do not edit", // 文件最后编辑时间
    "Deprecated": "否"
  },
  //函数注释
  "fileheader.cursorMode": {
    "LastEditors": "陈胜辉", // 文件最后编辑者
    "Version": "版本号, YYYY-MM-DD",
    "param": "",
    "return": "",
    "Deprecated": "否"
  },
  //---<
  //---> Todo Tree
  "todo-tree.general.tags": [
    "TODO",
    "FIXBUG",
    "MARK",
    "FIXME",
    "XXX",
  ],
  "todo-tree.highlights.customHighlight": {
    "TODO": {
      "icon": "pin",
      "foreground": "#00BFFF",
      "iconColour": "#00BFFF",
    },
    "FIXME": {
      "icon": "issue-reopened",
      "foreground": "red",
      "iconColour": "red",
    },
    "MARK": {
      "icon": "tag",
      "foreground": "#CD8500",
      "iconColour": "#CD8500",
    },
    "FIXBUG": {
      "icon": "tools",
      "foreground": "#D02090",
      "iconColour": "#D02090",
    },
    "XXX": {
      "icon": "unverified",
      "foreground": "green",
      "iconColour": "green",
    }
  },
  "workbench.iconTheme": "vscode-icons-mac",
  "dart.debugExternalLibraries": false,
  "dart.debugSdkLibraries": false,
}
```

插件

```
//Auto Rename Tag
//ESLint
//彩色括号
Bracket Pair Colorizer
//中文
Chinese (Simplified) Language Pack for Visual Studio Code
//翻译
Comment Translate
//相对路径
Path Intellisense
//格式化
Prettier - Code formatter
//注释查看
Todo Tree
//文件 方法注释
koroFileHeader
//富文本编辑
Markdown Preview Enhanced

```

![image.png](https://upload-images.jianshu.io/upload_images/1897259-c64b07d64dc1cbf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
