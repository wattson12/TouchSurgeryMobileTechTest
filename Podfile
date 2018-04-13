platform :ios, '11.0'

target 'TouchSurgeryTechTest' do
  use_frameworks!

  #RxSwift used for FRP bindings (useful for VM <-> V in MVVM)
  pod 'RxSwift', '~> 4.0'

  #RxCocoa adds UIKit / Foundation specific helpers on top of RxSwift (e.g. binding to a UILabel text, or creating an observable from URLSession request)
  pod 'RxCocoa', '~> 4.0'

  #Not an app dependency in the framework sense, but pulling in the linter tool via pods gives us an easier update path and allows pinning versions if required
  #linting is run via a run script build phase
  pod 'SwiftLint'

  #Another non dependency exactly but integrating swift gen to be able to create localisable helpers
  pod 'SwiftGen'

  target 'TouchSurgeryTechTestTests' do
    inherit! :search_paths
  end

  target 'TouchSurgeryTechTestUITests' do
    inherit! :search_paths
  end

end
