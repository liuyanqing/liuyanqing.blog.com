---
layout: post
title: Sublime Text使用总结
category: 工具使用
tags: Sublime Text
description: Sublime Text使用总结
---

# 个人Sublime Text使用总结
## 个人常用插件标配
[Package Control安装点这里](https://packagecontrol.io/installation)

* Emmet
* ConvertToUTF8
* AutoFileName
* Bracket Highlighter
* Doc​Blockr
* FileDiffs
* SideBarEnhancements

* JSFormat
  快捷键：`Ctrl + Alt + f`
* Babel

* ColorPicker


* MarkDown Editing
* MarkDown Preview

## 我的设置
    {
        "bold_folder_labels": true,
        "color_scheme": "Packages/Color Scheme - Default/Monokai.tmTheme",
        "fade_fold_buttons": false,
        "font_size": 16,
        "ha_style": "filled",
        "ignored_packages":
        [
            "Vintage"
        ],
        "translate_tabs_to_spaces": true,//把代码 tab 对齐转换为空格对齐
        "tab_size": 4, //空格数
        "save_on_focus_lost": true, //文件失去焦点自动保存
        "highlight_modified_tabs": true, //未保存的文件标签高亮
        "highlight_line": true, // 当前行标亮
        "show_encoding": true, //显示当前文件的编码
        "trim_trailing_white_space_on_save": true, //去掉每一行文本最后面的空格
        "word_wrap": false,   //自动换行
        "bold_folder_labels": true, //侧边栏文件夹加粗
        "show_full_path": true, //窗口title上显示当前编辑的文件的全路径
        "show_line_endings": true,
        "fade_fold_buttons": false, //显示代码块的倒三角
        "word_separators": "./\\()\"':,.;<>~!@#$%^&*|+=[]{}`~?",//双击选中中划线
        "rulers":
        [
          80,
          100
        ]
    }

## 有用快捷键
1. `Ctrl+P`——随意跳转
在输入栏输入，ST则会 对已经打开的文件或者目录进行搜索，并给出匹配最佳的搜索结果的预览。如果你不进行任何操作，将不会真正加载这些文件。可以进行后续输入以跳转到更精确的位置。

    `@` 符号跳转：输入@symbol跳转到symbol符号所在的位置。与`Ctrl+R`功能相同。
    `#` 关键字跳转：输入#keyword跳转到keyword所在的位置。与`Ctrl+;`功能相同。
    `:` 行号跳转：输入:12跳转到文件的第12行。与`Ctrl+G`功能相同。

2. `Ctrl+R`——定位函数
3. `Ctrl+Shift+L`——同时编辑多行
4. `Ctrl + J`——把当前选中区域合并为一行
5. `Ctrl + Enter`——在当前行下面新增一行然后跳至该行
6. `Ctrl + Shift + Enter`——在当前行上面增加一行并跳至该行

