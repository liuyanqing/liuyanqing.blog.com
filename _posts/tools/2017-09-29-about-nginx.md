---
layout: post
title: nginx 为什么能解决跨域
category: 工具使用
tags: nginx
description: nginx 与跨域
---

# nginx 与跨域
## 什么是跨域
### 什么是源
如果**协议**，**端口**（如果指定了一个）和**域名**对于两个页面是相同的，则两个页面具有相同的**源**。
### 同源策略
同源策略**控制**从一个源加载的文档或脚本如何与来自另一个源的资源进行交互。该策略控制交互情况分为以下三类：
1. 通常允许进行跨域写操作（Cross-origin writes）。例如链接（links），重定向以及表单提交。特定少数的HTTP请求需要添加 preflight。
2. 通常允许跨域资源嵌入（Cross-origin embedding）。参看`如何解决跨域问题`条目。
3. 通常不允许跨域读操作（Cross-origin reads）。但常可以通过内嵌资源来巧妙的进行读取访问。参看`如何解决跨域问题`条目。

## 如何解决跨域问题
### 1. 跨域资源嵌入方案
* `<script src="..."></script>`标签嵌入跨域脚本。语法错误信息只能在同源脚本中捕捉到。
* `<link rel="stylesheet" href="...">`标签嵌入CSS。由于CSS的松散的语法规则，CSS的跨域需要一个设置正确的`Content-Type`消息头。不同浏览器有不同的限制： IE, Firefox, Chrome, Safari (跳至CVE-2010-0051)部分 和 Opera。
* `<img>`嵌入图片。支持的图片格式包括PNG,JPEG,GIF,BMP,SVG,...
* `<video>` 和 `<audio>`嵌入多媒体资源。
* `<object>`, `<embed>` 和 `<applet>`的插件。
* `@font-face`引入的字体。一些浏览器允许跨域字体（ `cross-origin fonts`），一些需要同源字体（`same-origin fonts`）。
* `<frame>` 和 `<iframe>`载入的任何资源。站点可以使用`X-Frame-Options`消息头来阻止这种形式的跨域交互。

## nginx 为什么能解决跨域
nginx是一个高性能的web服务器，常用作反向代理服务器。nginx作为反向代理服务器，就是把http请求转发到另一个或者一些服务器上。 通过把本地一个url前缀映射到要跨域访问的web服务器上，就可以实现跨域访问。 对于浏览器来说，访问的就是同源服务器上的一个url。而nginx通过检测url前缀，把http请求转发到后面真实的物理服务器。并通过rewrite命令把前缀再去掉。这样真实的服务器就可以正确处理请求，并且并不知道这个请求是来自代理服务器的。 简单说，nginx服务器欺骗了浏览器，让它认为这是同源调用，从而解决了浏览器的跨域问题。又通过重写url，欺骗了真实的服务器，让它以为这个http请求是直接来自与用户浏览器的。 这样，为了解决跨域问题，只需要动一下nginx配置文件即可。
## nginx 反向代理配置
nginx 为解决反向代理问题增加了 ngx_http_proxy_module模块

    proxy_set_header Host  Host含义是表明请求的主机名
    proxy_set_header X-Forward-For

## 参考文章
1. [浏览器的同源策略](https://developer.mozilla.org/zh-CN/docs/Web/Security/Same-origin_policy)