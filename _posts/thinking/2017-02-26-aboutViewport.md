---
layout: post
title: 关于Viewport
category: 学习笔记
tags: viewport
description: 关于Viewport
---

# viewport
    viewport，等于浏览器窗口

## 一 物理像素 & 设备独立像素
`物理像素`:又称`设备像素`，是显示设备中一个最微小的物理部件。你所使用的各种设备都提供了正规的分辨率，并且其值可以（通常情况下）从`screen.width/height`属性中读出。
`设备独立像素`:又称`CSS像素`、`逻辑像素`、`密度无关像素`，是那些控制你的样式表如何渲染的像素。

物理像素 = 设备独立像素 * dpr

## 1 屏幕尺寸
    screen.width/height

* 意义：用户屏幕的整体大小。
* 度量单位：物理像素。
* 浏览器错误：IE8以CSS像素对其进行度量，IE7和IE8模式下都有这个问题。 
* 说明：它们包括用户屏幕的整个宽度和高度。它们的尺寸是以设备像素来进行度量的，因为它们永远不会变：它们是显示器的属性，而不是浏览器的。

## 2 窗口尺寸
    window.innerWidth/Height

* 意义：浏览器窗口的整体大小，包括滚动条。
* 度量单位：CSS像素。
* 浏览器错误：IE7不支持。Opera以设备像素进行度量。
* 说明：度量的宽度和高度是包括滚动条的。它们也被视为内部窗口的一部分。

## 3 滚动距离
    window.pageX/YOffset( == scrollX/Y )

* 意义：页面滚动的距离。
* 度量单位：CSS像素。
* 浏览器错误：无。
* 说明：返回相对于窗口显示区左边缘（上边缘）的水平方向（垂直方向）的距离，表示文档水平或垂直方向的滚动距离。

## 4 度量viewport
    document.documentElement.clientWidth/Height

* 意义：Viewport尺寸。
* 度量单位：CSS像素。
* 浏览器错误：无。
* 说明：用来约束你网站中最顶级包含块元素（containing block）`<html>`的。与`window.innerWidth/Height`是对冤家（浏览器战争的产物，那时Netscape只支持window.innerWidth/Height，IE只支持document.documentElement.clientWidth和Height），后者也被视为内部窗口的一部分。区别是document.documentElement.clientWidth/Height不包括滚动条。

## 5 度量`<html>`元素
    document.documentElement.offsetWidth/Height

* 意义：`<html>`元素（也就是页面）的尺寸。
* 度量单位：CSS像素。
* 浏览器错误：IE度量的是`viewport`，而不是`<html>`元素。

## 事件中的坐标
    pageX/Y, clientX/Y, screenX/Y

* `pageX/Y`提供了相对于<html>元素的以CSS像素度量的坐标。
* `clientX/Y`提供了相对于viewport的以CSS像素度量的坐标。
* `screenX/Y`提供了相对于屏幕的以设备像素进行度量的坐标。

## 6 媒体查询的`width/height` & `width/height`
* `width/height`使用和`documentElement .clientWidth/Height`（换句话说就是viewport宽高）一样的值。它是工作在CSS像素下的。
* `device-width/device-height`使用和`screen.width/height`（换句话说就是屏幕的宽高）一样的值。它工作在设备像素下面。

## 二 移动设备的visual viewport & layout viewport 
   把`layout viewport`想像成为一张不会变更大小或者形状的大图。现在想像你有一个小一些的框架，你通过它来看这张大图。这个小框架的周围被不透明的材料所环绕，这掩盖了你所有的视线，只留这张大图的一部分给你。你通过这个框架所能看到的大图的部分就是`visual viewport`。当你保持框架（缩小）来看整个图片的时候，你可以不用管大图，或者你可以靠近一些（放大）只看局部。你也可以改变框架的方向，但是大图（layout viewport）的大小和形状永远不会变。

   `visual viewport` 是页面当前显示在屏幕上的部分。用户可以通过滚动来改变他所看到的页面的部分，或者通过缩放来改变visual viewport的大小。

* `visual viewport`由设备各自提供，`visual viewport`的宽度也是`设备的独立像素`
* Retina屏增加了设备像素（`物理像素`），所以物理像素是有密度变化的
* dpr = 物理像素/设备独立像素 = 设备像素个数/`visual viewport`宽度;
* `vw` 和 `wh`：相对于布局视口大小计算尺寸，普通屏布局视口是 375px，高清屏是 750px，无论怎么变，`vw`/`vh` 单位的最后结果都会相应变化