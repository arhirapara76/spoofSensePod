//
//  ResultJsonObject.swift
//  spoof-sense-ios
//
//  Created by iMac on 10/02/23.
//

import Foundation

public class ResultJsonObject {
    public static let shared = ResultJsonObject()
    public var onGetResult:(([String:Any]) -> ())?
}
