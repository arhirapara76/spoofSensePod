# spoof-sense-ios

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.2+ | 5.0 | [CocoaPods](#cocoapods) | Fully Tested |

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate spoof-sense-ios into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod ''
```

## Usage

```
There are 3 screens:
1 Splice screen
2 Guideline screen
3 Camera screen
```

You can open any screen from any of the above screens.
You can also set a custom design, for which you have to call a function in the ViewController.

#Belove function


```
 func setupCustomUI(with appLogo: UIImage, appFirstName: String, appFirstNameTitleColor: UIColor, appLastName: String, appLastNameTitleColor: UIColor, appTitle: String, buttonTitle: String = "Check Liveness", appTitleColor: UIColor, buttonBackgroundColor: UIColor, buttonTextColor: UIColor, isShowGuidelinesScreen: Bool = true) {
```

```
appLogo: Whatever logo you set here should be set there, Size must been 40 * 40.
appFirstName: Set any firstname.
appLastName: Set any lastname.
appFirstNameTitleColor: Set your app firstname.
appLastNameTitleColor: Set your app lastname.
buttonTitle: Is optional, Set any buttonTitle by defult set is "Check Liveness".
buttonBackgroundColor: Set any button background color.
buttonTextColor: Set any button Text Color.
appTitle: Set any title.
appTitleColor: Set any title color.
isShowGuidelinesScreen: Is optional, By default, you have opened the Guidelines screen, if you pass false this, the Direct Camera screen opens.
```

## How to open any Viewcontroller & How to setupCustomUI 

For Example:
```
  let podBundle = Bundle(for: SplaceViewController.self)
  let storyBoard = UIStoryboard.init(name: "SpoofSense", bundle: podBundle)
  if let vc = storyBoard.instantiateViewController(withIdentifier: "SplaceViewController") as? SplaceViewController {
  vc.setupCustomUI(with appLogo: UIImage, appFirstName: "", appFirstNameTitleColor: UIColor.red, appLastName: "", appLastNameTitleColor: UIColor.red, appTitle: "", buttonTitle: String = "Check Liveness", appTitleColor: UIColor.red, buttonBackgroundColor: UIColor.red, buttonTextColor: UIColor.white, isShowGuidelinesScreen: Bool = true) // is Set CustomUI(Opetional)
    self.navigationController?.pushViewController(vc, animated: true)
```

## License

spoof-sense-ios is released under the MIT license. [See LICENSE](http://www.opensource.org/licenses/MIT) for details.
