//
//  ApiKeyClass.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import Foundation

public class ApiKeyClass {
    
    public class func apiKey(_ register: String)  {
        DispatchQueue.main.async {
            if !register.isEmpty {
                UserDefaults.standard.set(true, forKey: UserDefaultKeys.isUserSetApiKey.rawValue)
                UserDefaults.standard.set(register, forKey: UserDefaultKeys.userRegisterApiKey.rawValue)
            } else {
                UserDefaults.standard.set(false, forKey: UserDefaultKeys.isUserSetApiKey.rawValue)
                UserDefaults.standard.set("", forKey: UserDefaultKeys.userRegisterApiKey.rawValue)
            }
        }
    }
    
}

