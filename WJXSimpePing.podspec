Pod::Spec.new do |s|
s.name = 'WJXAlertView'
s.version = '1.0.3'
s.license = 'MIT'
s.summary = '弹窗控件,包含alert/sheet两种模式!'
s.description = '此控件是自定义弹窗控件,只是为了项目需求,模仿苹果原生弹窗的弹窗视图,同样包含alert/sheet两种模式,只是为了统一弹窗!'
s.homepage = 'https://github.com/wangjixiao1992/WJXAlertView'
s.authors = {'wangjixiao' => '642907599@qq.com' }
s.source = {:git => "https://github.com/wangjixiao1992/WJXAlertView.git", :tag => "v1.0.3"}
s.source_files  = "**/*.{h,m}"
s.platform = :ios, "8.0"
s.requires_arc = false
end
