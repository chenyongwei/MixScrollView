Pod::Spec.new do |s|
  s.name         = "MixScrollView"
  s.version      = "0.1.0"
  s.summary      = "MixScrollView is trying to build HorizontalScrollView inside VerticalScrollView"
  s.homepage     = "https://github.com/chenyongwei/MixScrollView"
  s.author       = { "Yongwei Chen" => "iamywchen@gmail.com" }
  s.source       = { :git => "https://github.com/chenyongwei/MixScrollView.git" }
  s.platform     = :ios, '6.0'
  s.source_files = 'MixScrollView/*.{h,m}'
  s.requires_arc = true
end