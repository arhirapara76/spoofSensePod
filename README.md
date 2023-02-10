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
There are main 3 screens:
1 Splice screen
2 Guideline screen
3 Camera screen
```

You can open any screen from any of the above screens.
You can also set a custom design, for which you have to call a function in the ViewController.

## Belove function

```
 SetCustomUI.shared.buttonBackgroundColor
 SetCustomUI.shared.appFirstName
 SetCustomUI.shared.buttonTextTitle
 SetCustomUI.shared.buttonTitleColor
 SetCustomUI.shared.isShowGuidelinesVC
 SetCustomUI.shared.appLogo
 SetCustomUI.shared.appFirstNameColor
 SetCustomUI.shared.appLastNameColor
 SetCustomUI.shared.appLastName
 SetCustomUI.shared.versionNumberString
 SetCustomUI.shared.versionNumberColor
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
versionNumberString: Set app versionNumber.
versionNumberColor: Set app versionNumber color.
isShowGuidelinesScreen: Is optional, By default, you have opened the Guidelines screen, if you pass false this, the Direct Camera screen opens.
```

## How to open any Viewcontroller & How to setupCustomUI 

For Example:
```
  SetCustomUI.shared.buttonBackgroundColor = .red

  let podBundle = Bundle(for: SplaceViewController.self)
  let storyBoard = UIStoryboard.init(name: "SpoofSense", bundle: podBundle)
  if let vc = storyBoard.instantiateViewController(withIdentifier: "SplaceViewController") as? SplaceViewController {
  self.navigationController?.pushViewController(vc, animated: true)
  }
```

## How to get result 

```
ResultJsonObject.shared.onGetResult // return jsonObject
```

## Exmple:
```
ResultJsonObject.shared.onGetResult = { [weak self] (jsonObject) -> Void in
    guard let self = self else { return }
    print("jsonObject: ", jsonObject)
}
```

## How to close result screen

```
ResultJsonObject.shared.onCloseView // call this block close the app
```

```
## Exmple:

  ResultJsonObject.shared.onCloseView = { [weak self] () -> Void in
    guard let self = self else { return }
  }
```

## License

spoof-sense-ios is released under the MIT license. [See LICENSE](http://www.opensource.org/licenses/MIT) for details.
