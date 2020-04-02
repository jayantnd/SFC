Pod::Spec.new do |s|
  s.name         = "SFF"
  s.version      = "1.0.0"
  s.summary      = "Swift Foundation Framework."
  s.homepage     = "https://github.com/jayantnd/SFF"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jayant Dash" => "jayantnd@gmail.com" }
  s.social_media_url   = "https://twitter.com/Jayant_dash"
  s.ios.deployment_target = "10.0"
  s.swift_versions = ['5.1', '5.2']
  s.source       = { :git => "https://github.com/jayantnd/SFF.git", :tag => s.version.to_s }
  s.source_files  = "SFF", "SFF/**/*.{swift,h,m}"
  s.public_header_files = "SFF/**/*.h"
  s.requires_arc = true
end
