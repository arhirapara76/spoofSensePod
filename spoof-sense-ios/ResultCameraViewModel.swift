//
//  ResultCameraViewModel.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import Foundation
import UIKit

typealias SuccessResponseWithJsonData = (_ jsonData : String) -> ()
typealias FailureResponse = (NSError?) -> (Void)

class ResultCameraViewModel {
    
    var btnTextTitle = "Check Liveness"
    var btnTitleColor = UIColor(named: "Button_Text_Color_FFFFFF")!
    var btnBackgroundColor = UIColor(named: "Button_BG_Color_0E68C0")!
    var isShowGuidelinesVC = true

    var base64ImageData = ""
    
    func postURLSessionGetData(success: @escaping SuccessResponseWithJsonData, failure: @escaping FailureResponse) {
        let apiKey = UserDefaults.standard.string(forKey: UserDefaultKeys.userRegisterApiKey.rawValue) ?? "Ek5Bnc6Aqx1W9Ye2JXf2G6w6u2sjRjvOaNK79z39"
        let parameters = ["data": base64ImageData]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        var request = URLRequest(url: URL(string: "https://rah9bywlua.execute-api.ap-south-1.amazonaws.com/prod/antispoofing")!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                failure(error as NSError?)
                return
            }
            DispatchQueue.main.async {
                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let detaill = jsonData["detail"] as? String {
                        failure(NSError(localizedDescription: detaill))
                    } else {
                        let detaill = jsonData["message"] as? String ?? ""
                        success(detaill)
                    }
                } else {
                    failure(NSError(localizedDescription: "No face found in the image, please ensure the submitted image meets the requirements."))
                }
            }
        }
        task.resume()
    }
}
