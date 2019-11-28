Pod::Spec.new do |s|
  s.name = "HySDKDeploy"
  s.version = "3.6.2"
  s.summary = "环信iOS SDK，用于真机打包"
  s.description = "环信IM的iOS SDK中，其framework文件经过lipo处理后，专用于armv7和arm64平台的真机打包的库。"
  s.homepage = "https://github.com/hecom-rn/HySDKDeploy"
  s.license = {
    :type => "Copyright",
    :text => "Hyphenate Inc. 2017"
  }
  s.authors = { "Mashuai" => "mashuai_hy@163.com" }
  s.source = { :http => "" }
  s.platform = :ios, "8.0"
  s.requires_arc = true
  s.preserve_paths = "iOS_Pods_IMFullSDK_V3.6.2/Hyphenate.framework"
  s.vendored_frameworks = "iOS_Pods_IMFullSDK_V3.6.2/Hyphenate.framework"
  s.pod_target_xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
end
