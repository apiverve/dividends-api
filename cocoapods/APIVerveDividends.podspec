Pod::Spec.new do |s|
  s.name             = 'APIVerveDividends'
  s.version          = '1.2.3'
  s.summary          = 'Dividends returns the dividend-per-share history for a US public company by ticker - the amount reported each quarter and year straight...'
  s.description      = <<-'DESC'
Dividends returns the dividend-per-share history for a US public company by ticker - the amount reported each quarter and year straight from official SEC filings - plus a derived dividend-growth summary with year-over-year growth, multi-year growth rates and a consecutive-years-of-growth streak calculated for you.

This iOS/macOS SDK provides a convenient way to access the Dividends from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/dividends?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/dividends-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveDividends/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
