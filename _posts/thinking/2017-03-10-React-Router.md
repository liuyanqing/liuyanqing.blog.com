---
layout: post
title: 关于React Router
category: 学习笔记
tags: React-Router
description: React Router学习笔记
---

# React Router
## 路由匹配原理
### 1 嵌套关系

### 2 路径语法
```
`:paramName` – 匹配一段位于 /、? 或 # 之后的 URL。 命中的部分将被作为一个参数
() – 在它内部的内容被认为是可选的
`*` – 匹配任意字符（非贪婪的）直到命中下一个字符或者整个 URL 的末尾，并创建一个 splat 参数
`**` - 匹配任意字符（贪婪的）直到命中下一个字符 /、? 或 #，并创建一个 splat 参数
```

### 3 优先级
路由算法会根据定义的顺序自顶向下匹配路由