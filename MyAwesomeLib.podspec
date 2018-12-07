#
# Be sure to run `pod lib lint MyAwesomeLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MyAwesomeLib'
  s.version          = '0.1.0'
  s.summary          = 'Automation core tools for iOS and tvOS testing'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    This automation tools allow to test an iOS and tvOS applications in the shortest way.
  DESC

  s.homepage         = 'https://github.com/SeverinetsDenis/MyAwesomeLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SeverinetsDenis' => 'severinetsdenis@gmail.com' }
  s.source           = { :git => 'https://github.com/SeverinetsDenis/MyAwesomeLib.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'MyAwesomeLib/Classes/**/*'
  
  s.dependency 'Alamofire', '~> 4.5.1'
  s.weak_framework = "XCTest"
  s.pod_target_xcconfig = {
      'ENABLE_BITCODE' => 'NO',
      'OTHER_LDFLAGS' => '-weak-lswiftXCTest',
      'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
      'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PLATFORM_DIR)/Developer/Library/Frameworks"',
  }

  # s.resource_bundles = {
  #   'MyAwesomeLib' => ['MyAwesomeLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
