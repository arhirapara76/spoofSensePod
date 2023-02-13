# spoof-sense-ios

## Requirements

| Platform | Minimum Swift Version | Installation
| --- | --- | --- |
| iOS 13.2+ | 5.0 | [CocoaPods](#cocoapods)

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate spoof-sense-ios into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'spoofSenseios'
```

## What this CocoaPod does?
This CocoaPod scans the realtime face and gives desired resultCallBack whether the captured face is valid or not.
 Now this CocoaPod have some guidelines for validating the face (Also you can see in Screen no.2 Guideline screen).
 - Ample lighting on the face.
 - No face tilt.
 - No multiple face detection.
 - Also this CocoaPod doesn't allow face from any other digital device except `Inperson Realtime Face`.


## How to:

This CocoaPod consist of mainly 3 screens.:
```
1 Splash screen
2 Guideline screen
3 Camera screen
```

![image](https://user-images.githubusercontent.com/104752632/218302185-0fc9f765-41df-4e6f-853b-34b6f2d0e5c8.jpg)


## Here you can decide and customize any screen you want to open.

Lest see them in detail:
- You can customize the App Name by applying firstname and lastname also you can set color for the same.
- You can customize other various parameters too:-

```
Set app version
Set app logo(40x40 size)
Set App name
Set Button background color,name and textcolor too.
etc...
```

How to customize:-
- You can also set a custom design, for which you have to call a function in the ViewController.

Below are the various properties:

 - SpoofSense.apiKey
 - SpoofSense.buttonBackgroundColor
 - SpoofSense.appFirstName
 - SpoofSense.buttonTextTitle
 - SpoofSense.buttonTitleColor
 - SpoofSense.isShowGuidelinesVC
 - SpoofSense.appLogo
 - SpoofSense.appFirstNameColor
 - SpoofSense.appLastNameColor
 - SpoofSense.appLastName
 - SpoofSense.versionNumberString
 - SpoofSense.versionNumberColor

Below are the various properties description:-

 - appLogo: Whatever logo you set here should be set there, Size must been 40 * 40.
 - appFirstName: Set any firstname.
 - appLastName: Set any lastname.
 - appFirstNameTitleColor: Set your app firstname.
 - appLastNameTitleColor: Set your app lastname.
 - buttonTitle: Is optional, Set any buttonTitle by defult set is "Check Liveness".
 - buttonBackgroundColor: Set any button background color.
 - buttonTextColor: Set any button Text Color.
 - versionNumberString: Set app versionNumber.
 - versionNumberColor: Set app versionNumber color.
 - isShowGuidelinesScreen: Is optional, By default, you have opened the Guidelines screen, if you pass false, Direct Camera screen open.

`Note:API Key is Mandatory.`

## How to open any Viewcontroller & How to setupCustomUI 

**For Example:**

  - SpoofSense.buttonBackgroundColor = .red
  - SpoofSense.apiKey = "Set_Your_Api_Key"
  
  **Open specific screen**
  - SpoofSense.showScreen = .openSplaceScreen // Open Any Screen(.openGuidelinesScreen, .openCameraScreen)
  - SpoofSense.showFaceGuidelinesScreen = false // By defult value is True, assign False skip GuidelinesScreen
  - SpoofSense.launch(with: Your_Navigation_Controller)


## How to get result 

```
SpoofSense.resultCallBack // return jsonObject
```

## Get result exmple:
```
SpoofSense.resultCallBack = { [weak self] (jsonObject) -> Void in
    guard let self = self else { return }
    print("jsonObject: ", jsonObject)
}
```

## License

spoof-sense-ios is released under the MIT license. [See LICENSE](http://www.opensource.org/licenses/MIT) for details.
