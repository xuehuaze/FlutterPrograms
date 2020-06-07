<h1 align = "center">FlutterPrograms</h1>

基于 [Flutter 热更新思路](https://nuttalk.com)，实现的工具箱应用。


## 应用截图

截图中首页的每个图标代表一个独立的 Flutter 程序。 Gif 中演示的为 Flutter 官方提供的两个独立的 Demo 程序。

> Gif 截图 2.4M ，实际效果，待 Gif 完全加载 。

![Screenshots](https://raw.githubusercontent.com/FlutterPrograms/FlutterPrograms/master/Screenshots/2019-05-01%2022_12_25.gif)

## 应用构建

- 搭建 Flutter 环境，项目环境为 Flutter 1.12.13 。
- 新建终端，进入 `tools` 目录 ，执行 `./tools.sh setup` 。
- 使用 Xcode 在 `iOS/FlutterPrograms` 目录中 `FlutterPrograms.xcworkspace` 
- 设置 `Product->Scheme->Edit Scheme->Run->Build Configuration` 为 `DebugHotLoad`。
- 新建终端，进入 `iOS/FlutterPrograms` 目录，执行 `pod install` 。
- `cmd + r` 运行 FlutterPrograms 。

## 详细介绍

详细介绍参见项目 [wiki](https://github.com/FlutterPrograms/FlutterPrograms/wiki) 。






