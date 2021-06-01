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
  SJUIKit-tvOS
                       DESC

  s.homepage         = 'https://gitee.com/changsanjiang/SJUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'changsanjiang@gmail.com' => 'changsanjiang@gmail.com' }
  s.source           = { :git => 'https://github.com/changsanjiang/SJUIKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform = :tvos, '9.0'
  s.tvos.deployment_target = '9.0'
  
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
end
