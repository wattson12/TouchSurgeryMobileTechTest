# TouchSurgeryMobileTechTest

## Summary

This is a tech test for touch surgery, following instructions [here](https://github.com/touch-surgery/mobile-tech-test)

The app is build using an MVVM-C architecture with RxSwift(/Cocoa) used for bindings between view and view model. Networking is done with `URLSession` abstracted behind a protocol, and models are represented as simple `Decodable` structs. Kingfisher is used for image caching 

## Tests

There are tests for most parts of the model layer, including view models, and `Observable` mapping helpers. No UI tests since I didn't have time, but the approach would be to create a mock `DataProvider` to be used when a UI test is active, which would return a specific set of data given a scenario (e.g. run a test with an empty response, or procedures with very long names)

## Other tools

I included Swiftlint to pick up any style issues, and Swiftgen is used to generate types instead of using key strings directly for localised strings (there are no assets here but it could be extended to do the same for UIImage creation)

## Persistence 

There is no persistence here other than image caching, but I would approach this by adding a persistence stack (e.g a core data stack). This can be passed to a view model to use as an initial value. Then during the observable chain there would be a step to update the stack (i.e. persist the fetched data). This means the view model doesnt need to know much about how data is stored, just the types which can be saved, and the actual save work can be implemented as an `Observable` extension and tested elsewhere. 
