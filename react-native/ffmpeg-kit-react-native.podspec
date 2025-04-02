require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source       = { :git => "https://github.com/arthenica/ffmpeg-kit.git", :tag => "react.native.v#{s.version}" }

  s.dependency "React-Core"

  s.default_subspec = 'video'

  s.subspec 'video' do |ss|
    ss.vendored_frameworks = 
    'Frameworks/ffmpeg-kit-ios-video/ffmpegkit.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libavdevice.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libavcodec.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libavfilter.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libavformat.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libavutil.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libswresample.xcframework', 
    'Frameworks/ffmpeg-kit-ios-video/libswscale.xcframework'

  end
end


