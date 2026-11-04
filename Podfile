platform :ios, '17.0'
use_frameworks!

inhibit_all_warnings!

target 'angeldaemontaro' do
  pod 'SwiftLint'
  pod 'SwiftGen'
  pod 'YoutubePlayerView', '~> 1.2'
  pod 'AvatarImagePicker', '~> 1.3'
  pod 'FirebaseAnalytics'
  pod 'FirebaseStorage'
  pod 'Google-Mobile-Ads-SDK'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
      end
    end
  end
end
