
Pod::Spec.new do |s|

  s.name         = "T21LoggerSwift"
  s.version      = "1.2.0"
  s.summary      = "The T21LoggerSwift class is a simple wrapper class for the SwiftyBeaver public third party logger library."
  s.author    = "Eloi Guzman Ceron"
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/worldline-spain/T21LoggerSwift.git", :tag => "1.2.0" }
  s.source_files  = "src/**/*.{swift}"
  s.framework  = "Foundation", "UIKit"
  s.requires_arc = true
  s.dependency "SwiftyBeaver", "~>1.4"

end
