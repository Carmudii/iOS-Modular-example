#
# Be sure to run `pod lib lint Network.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Network'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Network.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/carmudii/Network'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'carmudii' => 'carmudi@engineer.com' }
  s.source           = { :git => 'https://github.com/carmudii/Network.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Network/Module/**/*.{swift}'
  
  # s.resource_bundles = {
  #   'Network' => ['Network/Assets/*.png']
  # }
  s.resources = 'Network/Module/**/*.{storyboard,xib}'
  s.subspec 'Resources' do |dir|
    dir.resources = 'Network/Module/**/*.{xcassets,json,xcdatamodeld,otf}'
  end
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Common'
  s.dependency 'Moya/RxSwift', '15.0'
  s.dependency 'Moya', '15.0'
end
