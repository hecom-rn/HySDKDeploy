# **HySDKDeploy**

这是环信的iOS SDK，经过lipo处理后的，专用于armv7和arm64真机打包的Pod库。

## 安装方法

在iOS工程的Podfile中，添加如下语句。

```
pod 'HySDKDeploy'
```

具体用法参照环信官网：[http://docs.easemob.com/](http://docs.easemob.com/)

## 更新流程

### 更新zip文件

* 查看最新的Hyphenate.podspec：`pod spec cat Hyphenate`。
* 在Hyphenate的podspec文件中，找到source，下载zip包。
* 解压缩后，运行如下命令： [或者参考](<http://docs-im.easemob.com/im/ios/sdk/prepare#%E9%9B%86%E6%88%90%E5%8A%A8%E6%80%81%E5%BA%93%E4%B8%8A%E4%BC%A0appstore>)
    * `mv iOS_Pods_IMFullSDK_VX.X.X iOS_Pods_IMDeploySDK_VX.X.X`
    * `cd iOS_Pods_IMDeploySDK_VX.X.X`
    * `lipo Hyphenate.framework/Hyphenate -thin armv7 -output Hyphenate_armv7`
    * `lipo Hyphenate.framework/Hyphenate -thin arm64 -output Hyphenate_arm64`
    * `lipo -create Hyphenate_armv7 Hyphenate_arm64 -output Hyphenate`
    * `mv Hyphenate Hyphenate.framework/`
    * `rm -f Hyphenate_arm*`
* 重新压缩成`iOS_Pods_IMDeploySDK_VX.X.X.zip`。
* 新建一个目录，将zip文件拷贝到其中，然后运行如下命令：
    * `git init`初始化git配置。
    * 添加远程仓库。
    * `git stage .`暂存zip文件。
    * `git commit -m 'update'`提交新的zip文件。
    * `git push -f origin zip`强行推送到Github上。

### 更新Pod配置

* 进入当前仓库目录，切换本地到master分支，更新`HySDKDeploy.podspec`文件，包括其中的主版本号，和source下载链接版本号，以及路径中的版本号，使之与Hyphenate.podspec的版本号保持一致。
* `git push origin master`推送到Github上。
* `pod trunk push ./HySDKDeploy.podspec`发布podspec到CocoaPod上。
