#LGSelectButtonView.podspec
Pod::Spec.new do |s|
s.name         = "LGSelectButtonView"
s.version      = "1.0"
s.summary      = "A selection menu, can shrink into a button, can be expanded into a tableView. Button will always display the latest selected item on the title"

s.homepage     = "https://github.com/gang544043963/LGSelectButtonView"
s.license      = 'MIT'
s.author       = { "L&G" => "544043963@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/gang544043963/LGSelectButtonView.git", :tag => s.version}
s.source_files  = 'LGSelectButtonView/LGSelectButtonView/*.{h,m}'
s.requires_arc = true
end