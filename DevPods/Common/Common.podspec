#
# Be sure to run `pod lib lint Common.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Common'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Common.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/carmudii/Common'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'carmudii' => 'carmudi@engineer.com' }
  s.source           = { :git => 'https://github.com/carmudii/Common.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Common/Module/**/*.{swift}'
  # s.resource_bundles = {
  #   'Common' => ['Common/Assets/*.png']
  # }
  
  s.resources = 'Common/Module/**/*.{storyboard,xib}'
  s.subspec 'Resources' do |dir|
    dir.resources = 'Common/Module/**/*.{xcassets,json,xcdatamodeld,otf}'
  end

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'RxSwift', '6.5.0'
  s.dependency 'RxCocoa', '6.5.0'
  s.dependency 'CoreStore', '~> 9.0'
  s.dependency 'Shimmer'
end
