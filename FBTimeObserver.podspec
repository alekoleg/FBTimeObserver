Pod::Spec.new do |s|
  s.name         = "FBTimeObserver"
  s.version      = "0.0.1"
  s.summary      = "time observer"
  s.homepage     = "https://github.com/alekoleg/FBTimeObserver"
  s.license      = 'MIT'
  s.author       = { "Oleg Alekseenko" => "alekoleg@gmail.com" }
  s.source       = { :git => "https://github.com/alekoleg/FBTimeObserver", :tag => s.version.to_s}
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'

  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'

end
