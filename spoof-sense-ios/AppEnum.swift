//
//  AppEnum.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import Foundation
import UIKit

enum UserDefaultKeys: String {
    case isUserSetApiKey                                                 = "IsUserSetApiKey"
    case userRegisterApiKey                                              = "UserRegisterApiKey"
}

public enum SelecteLaunchScreen {
    case openSplaceScreen
    case openGuidelinesScreen
    case openCameraScreen
}

enum ResultValue: String, CaseIterable {
    case real                                                            = "real"
    case spoof                                                           = "spoof"
    
    var getResultMessage: String {
        switch self {
        case .real:
            return "Liveness Confirmed"
        case .spoof:
            return ""
        }
    }
}
