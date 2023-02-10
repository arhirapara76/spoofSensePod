//
//  ResultCameraViewModel.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import Foundation
import UIKit

typealias SuccessResponseWithString = (_ stringValue : String) -> ()
typealias FailureResponse = (NSError?) -> (Void)

class ResultCameraViewModel {
    
    var base64ImageData = ""
    
    func postURLSessionGetData(success: @escaping SuccessResponseWithString, failure: @escaping FailureResponse) {
        var jsonObject = [String: Any]()
        let apiKey = SetCustomUI.shared.apiKey
        let parameters = ["data": base64ImageData]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        var request = URLRequest(url: URL(string: "https://rah9bywlua.execute-api.ap-south-1.amazonaws.com/prod/antispoofing")!,timeoutInterval: Double.infinity)
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 400
            guard let data = data else {
                print(String(describing: error))
                failure(error as NSError?)
                jsonObject = ["statusCode": statusCode, "message": error?.localizedDescription ?? "", "status": false]
                ResultJsonObject.shared.onGetResult?(jsonObject)
                return
            }
            DispatchQueue.main.async {
                if let jsonData = try? (JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]) {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 400
                    if let detaill = jsonData["detail"] as? String {
                        failure(NSError(localizedDescription: detaill))
                        jsonObject = ["statusCode": statusCode, "message": detaill, "status": false]
                        ResultJsonObject.shared.onGetResult?(jsonObject)
                    } else {
                        let detaill = jsonData["message"] as? String ?? ""
                        let model_output = jsonData["model_output"] as! [String: Any]
                        if let pred_idx = model_output["pred_idx"] as? String, let resultValue = ResultValue(rawValue: pred_idx) {
                            switch resultValue {
                            case .real:
                                jsonObject = ["statusCode": statusCode, "message": resultValue.getResultMessage, "status": true]
                                success(resultValue.getResultMessage)
                            case .spoof:
                                jsonObject = ["statusCode": statusCode, "message": resultValue.getResultMessage, "status": false]
                                failure(NSError(localizedDescription: resultValue.getResultMessage))
                            }
                        } else {
                            jsonObject = ["statusCode": statusCode, "message": detaill, "status": true]
                            success(detaill)
                        }
                        ResultJsonObject.shared.onGetResult?(jsonObject)
                    }
                } else {
                    failure(NSError(localizedDescription: "No face found in the image, please ensure the submitted image meets the requirements."))
                }
            }
        }
        task.resume()
    }
}


public class ResultJsonObject {
    static let shared = ResultJsonObject()
    var onGetResult:(([String:Any]) -> ())?
}
