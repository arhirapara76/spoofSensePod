//
//  SetCustomUI.swift
//  spoof-sense-ios
//
//  Created by iMac on 10/02/23.
//

import Foundation
import UIKit

public class SetCustomUI {
    
    public static let shared = SetCustomUI()
    
    private var _appFirstName = "Spoof"
    private var _apiKey = "Ek5Bnc6Aqx1W9Ye2JXf2G6w6u2sjRjvOaNK79z39"
    private var _buttonTextTitle = "Check Liveness"
    private var _buttonTitleColor = UIColor(named: "Button_Text_Color_FFFFFF") ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private var _buttonBackgroundColor = UIColor(named: "Button_BG_Color_0E68C0") ?? #colorLiteral(red: 0.05490196078, green: 0.4078431373, blue: 0.7529411765, alpha: 1)
    private var _isShowGuidelinesVC = true
    private var _appLogo = UIImage()
    private var _appFirstNameColor = UIColor(named: "Button_BG_Color_0E68C0") ?? #colorLiteral(red: 0.05490196078, green: 0.4078431373, blue: 0.7529411765, alpha: 1)
    private var _appLastNameColor = UIColor(named: "Text_Color_222222") ?? #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    private var _appLastName = "Sense"
    private var _versionNumberString = "face v1.0.8"
    private var _versionNumberColor = UIColor(named: "Text_Color_222222") ?? #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    
    public var apiKey: String {
        get {
            return _apiKey
        }
        set {
            self._apiKey = newValue
        }
    }
    
    public var appFirstName: String {
        set {
            _appFirstName = newValue
        }
        get {
            return _appFirstName
        }
    }
    
    public var buttonTextTitle: String {
        get {
            return _buttonTextTitle
        }
        set {
            self._buttonTextTitle = newValue
        }
    }
    
    public var buttonTitleColor: UIColor {
        get {
            return _buttonTitleColor
        }
        set {
            self._buttonTitleColor = newValue
        }
    }
    
    public var buttonBackgroundColor: UIColor {
        get {
            return _buttonBackgroundColor
        }
        set {
            self._buttonBackgroundColor = newValue
        }
    }
    
    public var isShowGuidelinesVC: Bool {
        get {
            return _isShowGuidelinesVC
        }
        set {
            self._isShowGuidelinesVC = newValue
        }
    }
    
    public var appLogo: UIImage {
        get {
            let podBundle = Bundle(for: SplaceViewController.self)
            let image = UIImage(named: "ic_splace_logo", in: podBundle, compatibleWith: nil)
            _appLogo = image!
            return image!
        }
        set {
            _appLogo = newValue
        }
    }
    
    public var appFirstNameColor: UIColor {
        get {
            return _appFirstNameColor
        }
        set {
            self._appFirstNameColor = newValue
        }
    }
    
    public var appLastNameColor: UIColor {
        get {
            return _appLastNameColor
        }
        set {
            self._appLastNameColor = newValue
        }
    }
    
    public var appLastName: String {
        get {
            return _appLastName
        }
        set {
            self._appLastName = newValue
        }
    }
    
    public var versionNumberString: String {
        get {
            return _versionNumberString
        }
        set {
            self._versionNumberString = newValue
        }
    }
    
    public var versionNumberColor: UIColor {
        get {
            return _versionNumberColor
        }
        set {
            self._versionNumberColor = newValue
        }
    }
}
