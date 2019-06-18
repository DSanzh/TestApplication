# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'


def main_pods
  pod 'SnapKit', '~> 5.0.0'
  pod 'Moya/RxSwift', '~> 13.0.1'
  pod 'RxSwift', '~> 4.5.0'
  pod 'RxCocoa', '~> 4.5.0'
  pod 'L10n-swift', '~> 5.4'
  pod 'SwiftLint', '~> 0.32.0'
end

def test_libs
  pod 'Quick', '~> 2.1.0'
  pod 'Nimble', '~> 8.0.1'
end

def ui_libs
  pod 'EarlGrey', '~> 1.15.0'
end

target 'HeadsAndHands' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  main_pods
  target 'HeadsAndHandsUITests' do
    test_libs
  end
  target 'HeadsAndHandsTests' do
    ui_libs
  end
end
 
