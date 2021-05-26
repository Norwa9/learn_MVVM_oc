# MVVMTest
## 一、前言

现在网上一抓一大把都是MVVM讲解，但是demo大部分都是MVVM+RAC的，较少有用oc现有的如block，delegate等来充当胶水作用的demo。本文附上MVVM+block的demo来讲解MVVM的原理。

## 源来：

因为MVC严重困扰开发者的问题:

> 厚重的ViewController
> 遗失的网络逻辑（没有属于它的位置）
> 较差的可测试性
所以出现了新的架构MVVM

 ## 二、什么是MVVM

概念:(如图)
![MVVM](http://upload-images.jianshu.io/upload_images/1686195-716b74a75817279e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
简单的说就是在MVC的基础上，把C拆出 个ViewModel专负责数据和相关逻辑处理的东西，就是MVVM。
各个的作用:

> 1.view作用：控制视图的UI。通过viewModel控制它的显示，点击它的控件通过viewModel刷新model。（由于用block，中间需要vc的胶水作用）
> 2.viewController的作用：充当viewModel和view的胶水作用。
> 3.viewModel的作用：处理相关逻辑（业务，视图显示）和网络请求，桥接model和view，viewController的作用。
> 4.model的作用：存储数据。通过viewModel刷新view的显示，view点击事件通过viewModel刷新自己。（由于用block，中间需要vc的胶水作用）
进一步阐述：

姑且将view和viewController看成view
> 1.在MVVM中,view不能直接引用model,而是通过引用viewModel来间接引用model，反过来也是不能。
> 2.view可以引用viewModel ----- (viewModel也可以引用view如loading,最好不要,确保viewModel只处理逻辑和网络相关,这样耦合度更低,也方便测试)
> 3.viewModel可以引用model,反过来最好不要（保持mvvm纯粹的结构）
> 4.viewModel里面应该放些什么样的东西呢?一般viewModel中放置相关逻辑(业务,视图显示)及网络请求
充当胶带作用有（demo仅仅使用block）：
> ReactiveCocoa（RAC），KVO，Notification，block，delegate和target-action
优点：
方便测试:通常来说,要进行,界面测试比较困难,而MVVM可以对viewModel进行测试（还没搞过，有时间搞下下）
方便业务的复用:例如把一些视图逻辑放在一个ViewModel里面,让很多view/ViewController进行重用
方便对职责进行划分:例如可以让一些人专门开发UI,一些人专门开发逻辑
代码更加优雅,增加可维护性,耦合度降低
缺点：
造成大量胶水代码：当页面的交互逻辑非常多时，需要频繁的在V／VC-VM-M来回传递信息。（所以大家都用RAC就是因为这个原因，能相对减少些胶水代码）
代码写起来会更费劲一点
三、MVVM实例
