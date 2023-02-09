Pod::Spec.new do |s|
    s.name             = "spoofSenseios"
    s.version          = "0.0.2"
    s.summary          = 'Check Face'
    s.license          = 'MIT'
    s.author           = {'Ajay' => 'ajay@appringer.com'}

    s.source           = { :git => 'https://github.com/arhirapara76/spoofSensePod.git', :tag => "#{s.version}" }

    s.homepage = "https://github.com/arhirapara76/spoofSensePod"

    s.ios.deployment_target = '13.2'
    s.requires_arc = true

    s.source_files = 'spoofSensePod', 'spoof-sense-ios/**/*.{swift}'

    s.frameworks = 'UIKit', 'Foundation','AVFoundation','AVKit','MobileCoreServices'
    s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
end