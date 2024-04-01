Pod::Spec.new do |s|
    s.name             = 'Datasenses-iOS'
    s.version          = '0.1.2'
    s.summary          = 'Datasenses SDK for iOS.'
    s.homepage         = 'https://datasenses.io'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'Duc Nguyen' => 'duc.nguyen@datasenses.io' }
    s.source           = { :git => 'git@github.com:datasenses/datasenses-ios.git', :tag => s.version.to_s }
    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'Datasenses.xcframework'
    s.swift_version = '5.0'
    s.framework    = 'CoreTelephony'
  end