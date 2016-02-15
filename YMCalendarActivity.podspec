Pod::Spec.new do |spec|
  spec.name             = 'YMCalendarActivity'
  spec.version          = '1.1.1'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/ymyzk/YMCalendarActivity'
  spec.authors          = { 'Yusuke Miyazaki' => 'miyazaki.dev@gmail.com' }
  spec.summary          = 'YMCalendarActivity is a custom UIActivity that adds event to the calendar with EKEventEditViewController.'
  spec.source           = { :git => 'https://github.com/ymyzk/YMCalendarActivity.git', :tag => 'v1.1.1' }
  spec.source_files     = 'YMCalendarActivity/*.{h,m}'
  spec.resources        = 'YMCalendarActivity/*.png'
  spec.framework        = 'EventKitUI'
  spec.platform         = :ios, '7.0'
  spec.requires_arc     = true
end
