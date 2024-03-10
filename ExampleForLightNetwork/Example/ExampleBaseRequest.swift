//
//  ExampleBaseRequest.swift
//  ExampleForLightNetwork
//
//  Created by 童玉龙 on 2024/3/9.
//

import LightNetwork
import Alamofire
import Foundation


public enum ExampleServerError: Error {
    
    case invalidParameter
    
    case parsingFailure
    
    case customError
}


class ExampleBaseRequest: LNRequest {
    
    var errorCode : Int = 0
    var responseData : Any?
    
    //Global Reqponse,error handle
    override func process(response: AFDataResponse<Data?>, success: LNRequestSuccess?, failure: LNRequestFailure? = nil) {
        switch response.result {
        case let .success(data):
            guard let sourceData = data else { return }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: sourceData, options: .allowFragments)
                
                let code : Int = (jsonData as! [String : Any])["code"] as! Int
                if code == 200 {
                    success?(self, jsonData)
                }else {
                    failure?(self, ExampleServerError.invalidParameter)
                }
                
            } catch {
                let error = AFError.responseSerializationFailed(reason: .jsonSerializationFailed(error: error))
                failure?(self, error)
            }
        case let .failure(error):
            failure?(self, error)
        }
    }
    
    override func processDownload(response: AFDownloadResponse<URL?>, success: LNRequestSuccess?, failure: LNRequestFailure? = nil) {
        switch response.result {
        case let .success(data):
            success?(self, data?.absoluteString as Any)
        case let .failure(error):
            failure?(self, error)
        }
    }
    
}
