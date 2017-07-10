Pod::Spec.new do |s|

  s.name             = "Combinatorics"
  s.version          = "1.1"
  s.summary          = "Combinatorics contains functions to generate k-permutations and k-combinations (with or without repetition) of 'n' elements."
  s.description      = "Combinatorics contains static functions to generate k-permutations and k-combinations (in both cases either with or without repetition) of the 'n' elements in an array."
  s.homepage         = "https://github.com/almata/Combinatorics"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Albert Mata" => "hello@albertmata.net" }
  s.social_media_url = "http://twitter.com/almata"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source           = { :git => "https://github.com/almata/Combinatorics.git", :tag => "1.1" }
  s.source_files     = "Combinatorics/**/*.{h,m,swift}"
end
