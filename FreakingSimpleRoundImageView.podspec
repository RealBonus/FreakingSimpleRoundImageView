#
# Be sure to run `pod lib lint FreakingSimpleRoundImageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FreakingSimpleRoundImageView'
  s.version          = '1.0.0'
  s.summary          = 'A freakin simple RoundImageView. With Interface Builder support.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Very simple RoundImageView, with Interface Builder support. In swift. Grab it and make something neat.'
  s.homepage         = 'https://github.com/realbonus/FreakingSimpleRoundImageView'
  s.screenshots      = 'https://raw.githubusercontent.com/RealBonus/FreakingSimpleRoundImageView/master/Screenshots/IB.png', 'https://raw.githubusercontent.com/RealBonus/FreakingSimpleRoundImageView/master/Screenshots/Attributes.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'realbonus' => 'p.anokhov@gmail.com' }
  s.source           = { :git => 'https://github.com/realbonus/FreakingSimpleRoundImageView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FreakingSimpleRoundImageView/Classes/**/*'

end
