Pod::Spec.new do |s|
s.name = 'WJXSimpePing'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = '弹此工程苹果的simpePing的封装'
s.description = '此工程苹果的simpePing的封装!ping域名'
s.homepage = 'https://github.com/wangjixiao1992/WJXSimpePing'
s.authors = {'wangjixiao' => '642907599@qq.com' }
s.source = {:git => "https://github.com/wangjixiao1992/WJXSimpePing.git", :tag => "v1.0.0"}
s.source_files  = "**/*.{h,m}"
s.platform = :ios, "8.0"
s.requires_arc = false
end
