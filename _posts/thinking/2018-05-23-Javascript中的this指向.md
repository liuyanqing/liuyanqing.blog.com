---
layout: post
title: Javascript中的this指向
category: 学习笔记
tags: javascript
description: Javascript中的this指向
---

# Javascript中的this指向
## 函数调用
非箭头函数内，this 指向函数运行时调用它的对象。
箭头函数内，this 指向定义时所在的对象。
### （1）全局性调用的函数内 —— this 指向全局性对象 window
    // code 例子
    var x = 1
    function test(){
      alert(this.x)
    }
    test() // 1

### （2）作为对象方法调用的函数内 —— this 指向上级对象
    // code 例子
    function test(){
    　alert(this.x)
    }
    var o = {}
    o.x = 1
    o.m = test
    o.m() // 1

### （3）箭头函数内 —— this 指向定义时所在的对象
    function foo() {
      id = 42
      setTimeout(() => {
        console.log(this.id)
      }, 100)
    }
    var id = 21
    foo() // 42

## 构造函数内 —— this 指向实例对象
    var x = 2
    function test() {
      this.x = 1
    }
    var o = new test()
    console.log(o.x) // 1

### ES6 的 class
ES6 的类即构造函数的封装，完全可以看作构造函数的另一种写法。因此，类的方法内部如果含有`this`，它默认指向类的实例。

## 函数方法调用函数
### apply() & call() 
先把`apply()`MDN文档定义搬运过来：
    apply() 方法调用一个函数, 使其具有一个指定的this值，以及作为一个数组（或类似数组的对象）提供的参数。

因此，`apply()`调用的函数的 this 指向 `apply()`方法的第一个参数，apply()的参数为空时，默认调用全局对象。因此，这时的this指的是全局对象。
    var x = 0
    function test(){
    　alert(this.x)
    }
    var o={}
    o.x = 1
    o.m = test　　
    o.m.apply() //0
    o.m.apply(o) //1

### bind()
直接`bind()`MDN文档定义搬运过来：
    bind()方法创建一个新的函数, 当被调用时，将其this关键字设置为提供的值，在调用新函数时，在新函数参数列表前加上提供的给定的参数序列。