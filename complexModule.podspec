#
#  Be sure to run `pod spec lint complexModule.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "complexModule"
  s.version      = "0.0.1"
  s.summary      = "A module for complex apply."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  A module for complex apply,
                   DESC

  s.homepage     = "https://github.com/lowester/complexModule"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "lowester" => "1434147479@qq.com" }

if ENV['pipeline']
  pipeline = ENV['pipeline']
end

if pipeline
  s.source       = { :git => "https://github.com/lowester/complexModule.git", :tag => "#{pipeline}.#{s.version}" }
else
  s.source       = { :git => "https://github.com/lowester/complexModule.git", :tag => "#{s.version}" }
end



  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '${PODS_ROOT}/**' , 'COMPRESS_PNG_FILES' => 'NO'}
    
  s.subspec 'core' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.requires_arc = true

    ss.source_files = 'common/**/*.{h,m}'   #指定源码位置
    ss.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '${PODS_ROOT}/**' , 'COMPRESS_PNG_FILES' => 'NO'}
    ss.frameworks = 'UIKit', 'Foundation'
  end

  s.subspec 'pipeline1' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.requires_arc = true
    ss.source_files = 'pipeline1/**/*.{h,m}'   #指定源码位置
    ss.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '${PODS_ROOT}/**' , 'COMPRESS_PNG_FILES' => 'NO'}
    ss.frameworks = 'UIKit', 'Foundation'
    ss.dependency 'complexModule/core'

  end

  s.subspec 'pipeline2' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.requires_arc = true
    ss.source_files = 'pipeline2/**/*.{h,m}'   #指定源码位置
    ss.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '${PODS_ROOT}/**' , 'COMPRESS_PNG_FILES' => 'NO'}
    ss.frameworks = 'UIKit', 'Foundation'
    ss.dependency 'complexModule/core'

  end
  
if pipeline
  s.default_subspecs = 'core', "#{pipeline}"
else
  s.default_subspecs = 'core'
end

end
