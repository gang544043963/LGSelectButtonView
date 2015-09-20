#LGSelectButtonView.podspec
Pod::Spec.new do |s|
s.name         = "LGSelectButtonView"
s.version      = "1.0"
s.summary      = "一个选择菜单，可以收缩成一个button，可以展开成一个tableView。button上始终显示最新选择的条目的title"

s.homepage     = "https://github.com/gang544043963/LGSelectButtonView"
s.license      = 'MIT'
s.author       = { "L&G" => "544043963@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/gang544043963/LGSelectButtonView.git", :tag => s.version}
s.source_files  = 'LGSelectButtonView/LGSelectButtonView/*.{h,m}'
s.requires_arc = true
end