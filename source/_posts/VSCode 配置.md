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
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "search.location": "panel",
  "dart.warnWhenEditingFilesOutsideWorkspace": false,
  //主题
  "workbench.colorTheme": "Visual Studio Dark",
  "editor.wordWrap": "on",
  "workbench.activityBar.visible": true,
  "breadcrumbs.enabled": true,
  // tab间隔
  "editor.tabSize": 2,
  "editor.wordWrapColumn": 100,
  // #每次保存的时候自动格式化
  "editor.formatOnSave": true,
  // 每次保存的时候将代码按eslint格式进行修复
  "eslint.autoFixOnSave": true,
  // 代码补全
  "editor.quickSuggestions": {
    "other": true,
    "comments": true,
    "strings": true
  },
  //---> Prettier - Code formatter 代码格式化
  // 使用单引号
  "prettier.singleQuote": true,
  // 结尾不加分号
  "prettier.semi": false,
  // 尾随逗号
  "prettier.trailingComma": "all",
  //---<
  //---> vue格式化
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    {
      "language": "vue",
      "autoFix": true
    }
  ],
  //---<
  //---> 文件、方法注释配置 koroFileHeader
  "fileheader.configObj": {
    "autoAdd": true, // 自动添加头部注释开启才能自动添加
    "autoAlready": true, // 默认开启
    "language": {
      "dart": {
        "head": "/* MARK:",
        "middle": " * @",
        "end": " */"
      },
    },
  },
  "fileheader.customMade": {
    "Description": "类描述",
    "Author": "陈胜辉",
    "Date": "Do not edit", // 文件创建时间(不变)
    "Version": "版本号, YYYY-MM-DD",
    "LastEditors": "陈胜辉", // 文件最后编辑者
    "LastEditTime": "Do not edit", // 文件最后编辑时间
    "Deprecated": "否"
  },
  "fileheader.cursorMode": {
    "LastEditors": "陈胜辉", // 文件最后编辑者
    "Version": "版本号, YYYY-MM-DD",
    "param": "",
    "return": "",
    "Deprecated": "否"
  },
  //---<
  //---> todo配置 Todo Tree
  "todo-tree.general.tags": [
    "TODO",
    "FIXBUG",
    "MARK",
    "// //",
    "/* */",
    "FIXME",
    "XXX",
  ],
  "todo-tree.highlights.customHighlight": {
    "TODO": {
      "icon": "pin",
      "foreground": "cyan",
      "iconColour": "cyan",
    },
    "FIXME": {
      "icon": "issue-reopened",
      "foreground": "red",
      "iconColour": "red",
    },
    "MARK": {
      "icon": "tag",
      "foreground": "green",
      "iconColour": "orange",
    },
    "FIXBUG": {
      "icon": "tools",
      "foreground": "green",
      "iconColour": "lime",
    },
    "XXX": {
      "icon": "unverified",
      "foreground": "green",
      "iconColour": "green",
    }
  },
  //---<
}
```

插件

```
//Auto Rename Tag
//ESLint
Bracket Pair Colorizer
Chinese (Simplified) Language Pack for Visual Studio Code
Path Intellisense
Prettier - Code formatter
Todo Tree
```

![image.png](https://upload-images.jianshu.io/upload_images/1897259-c64b07d64dc1cbf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
