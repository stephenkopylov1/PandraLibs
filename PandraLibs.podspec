#
# Be sure to run `pod lib lint PandraLibs.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PandraLibs"
  s.version          = "0.1.6"
  s.summary          = "Frequently used utilits and libraries for Pandra's projects"
  s.description      = <<-DESC
                        Frequently used utilits and libraries for Pandra's projects.
                       DESC
  s.homepage         = "https://github.com/stephenkopylov/PandraLibs"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Stephen Kopylov" => "sk@pandra.ru" }
  s.source           = { :git => "https://github.com/stephenkopylov/PandraLibs.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'PandraLibs/Classes'

  s.resource_bundles = {
    'PandraLibs' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'RMMapper'
end
