platform :ios, "8.0"
use_frameworks!

#sources
source 'https://github.com/CocoaPods/Specs.git'

workspace 'T21Logger'
project 'T21Logger'

target 'T21Logger' do
#Dependencies for the primary target (the main app or the main library)
use_frameworks!

pod 'SwiftyBeaver', '~>1.1.1'

end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
end
end
end


