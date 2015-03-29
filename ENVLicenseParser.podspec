Pod::Spec.new do |s|
  s.name                  = "ENVLicenseParser"
  s.version               = "1.0.0"
  s.summary               = "A parser for AAMVA license barcode formats"
  s.homepage              = "https://github.com/envoy/ENVLicenseParser"
  s.license               = "MIT"
  s.author                = { "Envoy" => "" }
  s.social_media_url      = "https://twitter.com/signwithenvoy"
  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"
  s.source                = { :git => "https://github.com/envoy/ENVLicenseParser", :tag => "v#{ s.version }" }
  s.source_files          = "ENVLicenseParser/*.{h,m}"
  s.public_header_files   = "ENVLicenseParser/ENVPerson.h", "ENVLicenseParser/ENVBaseLicenseParser.h"
  s.requires_arc          = true
end
