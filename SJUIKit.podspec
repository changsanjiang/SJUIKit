#
# Be sure to run `pod lib lint SJUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SJUIKit'
  s.version          = '0.0.0.55'
  s.summary          = 'SJUIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  `Objective-C` UIKit
                       DESC

  s.homepage         = 'https://gitee.com/changsanjiang/SJUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'changsanjiang@gmail.com' => 'changsanjiang@gmail.com' }
  s.source           = { :git => 'https://github.com/changsanjiang/SJUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SJUIKit/*.{h,m}'
  
  s.subspec 'AsyncLoad' do |ss|
      ss.source_files = 'SJUIKit/AsyncLoad/*.{h,m}'
      ss.dependency 'SJUIKit/CornerMask'
  end
  
  s.subspec 'Queues' do |ss|
    ss.source_files = 'SJUIKit/Queues/*.{h,m}'
  end
  
  s.subspec 'Base' do |ss|
    ss.source_files = 'SJUIKit/Base/*.{h,m}'
    ss.dependency 'SJUIKit/ObserverHelper'
    ss.subspec 'Core' do |sss|
      sss.source_files = 'SJUIKit/Base/Core/*.{h,m}'
    end
  end
  
  s.subspec 'ObserverHelper' do |ss|
    ss.source_files = 'SJUIKit/ObserverHelper/*.{h,m}'
  end
  
  s.subspec 'AttributesFactory' do |ss|
    ss.source_files = 'SJUIKit/AttributesFactory/*.{h,m}'
    ss.subspec 'UIKitText' do |sss|
      sss.source_files = 'SJUIKit/AttributesFactory/UIKitText/*.{h,m}'
    end
    ss.subspec 'Deprecated' do |sss|
      sss.source_files = 'SJUIKit/AttributesFactory/Deprecated/*.{h,m}'
    end
  end
  
  s.subspec 'Refresh' do |ss|
      ss.source_files = 'SJUIKit/Refresh/*.{h,m}'
      ss.dependency 'MJRefresh'
  end
  
  s.subspec 'Date' do |ss|
    ss.source_files = 'SJUIKit/Date/*.{h,m}'
  end
  
  s.subspec 'UIMaker' do |ss|
    ss.source_files = 'SJUIKit/UIMaker/*.{h,m}'
    ss.subspec 'Core' do |sss|
      sss.source_files = 'SJUIKit/UIMaker/Core/*.{h,m}'
    end
  end
  
  s.subspec 'Thread' do |ss|
    ss.source_files = 'SJUIKit/Thread/*.{h,m}'
  end
  
  s.subspec 'CornerMask' do |ss|
    ss.source_files = 'SJUIKit/CornerMask/*.{h,m}'
    ss.dependency 'SJUIKit/ObserverHelper'
  end
  
  s.subspec 'Other' do |ss|
    ss.source_files = 'SJUIKit/Other/*.{h,m}'
    ss.dependency 'SJUIKit/Date'
  end
  
  s.subspec 'Photo' do |ss|
    ss.source_files = 'SJUIKit/Photo/*.{h,m}'
  end
  
  s.subspec 'SQLite3' do |ss|
      ss.source_files = 'SJUIKit/SQLite3/*.{h,m}'
      
      ss.subspec 'Protocol' do |sss|
          sss.source_files = 'SJUIKit/SQLite3/Protocol/*.{h,m}'
      end
      
      ss.subspec 'Core' do |sss|
          sss.source_files = 'SJUIKit/SQLite3/Core/*.{h,m}'
          sss.dependency 'SJUIKit/SQLite3/Protocol'
      end
      
      ss.dependency 'YYModel'
  end
  
  s.subspec 'PageViewController' do |ss|
    ss.source_files = 'SJUIKit/PageViewController/*.{h,m}'
    ss.subspec 'Core' do |sss|
      sss.source_files = 'SJUIKit/PageViewController/Core/*.{h,m}'
    end
  end
end
