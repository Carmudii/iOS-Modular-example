# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

workspace 'App.xcworkspace'
project 'App.xcodeproj'

def common_pod
  pod 'Common', :path => 'DevPods/Common'
end

def home_pod
  pod 'Home', :path => 'DevPods/Home'
end

def network_pod
pod 'Network', :path => 'DevPods/Network'
end

def development_pods
  common_pod
  network_pod
  home_pod
end

def external_git_pod
  pod 'Shimmer', :git => 'https://github.com/facebookarchive/Shimmer'
end

target 'App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Base Code
  development_pods
  external_git_pod
end

target 'AppTests' do
  inherit! :search_paths
  # Pods for testing
end

target 'AppUITests' do
  # Pods for testing
end

target 'Common_Example' do
  use_frameworks!
  project 'DevPods/Common/Example/Common.xcodeproj'

  common_pod
end

target 'Home_Example' do
  use_frameworks!
  project 'DevPods/Home/Example/Home.xcodeproj'

  home_pod
end

target 'Network_Example' do
  use_frameworks!
  project 'DevPods/Network/Example/Network.xcodeproj'
  
  network_pod
end
