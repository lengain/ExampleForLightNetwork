//
//  ExampleBaseRequest.swift
//  ExampleForLightNetwork
//
//  Created by 童玉龙 on 2024/3/9.
//

import LightNetwork
import Alamofire
import Foundation
class ExampleBaseRequest: LNRequest {
    
    //Global Reqponse,error handle
    override func process(response: AFDataResponse<Data?>, success: LNRequestSuccess?, failure: LNRequestFailure? = nil) {
        super.process(response: response, success: success, failure: failure)
    }
    
    override func processDownload(response: AFDownloadResponse<URL?>, success: LNRequestSuccess?, failure: LNRequestFailure? = nil) {
        super.processDownload(response: response, success: success, failure: failure)
    }
    
}
