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
        
    public var apiKey: String {
        get {
            return "Ek5Bnc6Aqx1W9Ye2JXf2G6w6u2sjRjvOaNK79z39"
        }
        set {
            self.apiKey = newValue
        }
    }
    
    public var buttonTextTitle: String {
        get {
            return "Check Liveness"
        }
        set {
            self.buttonTextTitle = newValue
        }
    }
    
    public var buttonTitleColor: UIColor {
        get {
            return UIColor(named: "Button_Text_Color_FFFFFF") ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        set {
            self.buttonTitleColor = newValue
        }
    }
    
    public var buttonBackgroundColor: UIColor {
        get {
            return UIColor(named: "Button_BG_Color_0E68C0") ?? #colorLiteral(red: 0.05490196078, green: 0.4078431373, blue: 0.7529411765, alpha: 1)
        }
        set {
            self.buttonBackgroundColor = newValue
        }
    }
    
    public var isShowGuidelinesVC: Bool {
        get {
            return true
        }
        set {
            self.isShowGuidelinesVC = newValue
        }
    }
    
    public var appLogo: UIImage {
        get {
            return UIImage(named: "ic_splace_logo")!
        }
        set {
            self.appLogo = newValue
        }
    }
    
    public var appFirstName: String {
        get {
            return "Spoof"
        }
        set {
            self.appFirstName = newValue
        }
    }
    
    public var appFirstNameColor: UIColor {
        get {
            return UIColor(named: "Button_BG_Color_0E68C0") ?? #colorLiteral(red: 0.05490196078, green: 0.4078431373, blue: 0.7529411765, alpha: 1)
        }
        set {
            self.appFirstNameColor = newValue
        }
    }
    
    public var appLastNameColor: UIColor {
        get {
            return UIColor(named: "Text_Color_222222") ?? #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        }
        set {
            self.appLastNameColor = newValue
        }
    }
    
    public var appLastName: String {
        get {
            return "Sense"
        }
        set {
            self.appLastName = newValue
        }
    }
    
    public var versionNumberString: String {
        get {
            return "face v1.0.8"
        }
        set {
            self.versionNumberString = newValue
        }
    }
    
    public var versionNumberColor: UIColor {
        get {
            return UIColor(named: "Text_Color_222222") ?? #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        }
        set {
            self.versionNumberColor = newValue
        }
    }
}
