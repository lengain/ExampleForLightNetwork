//
//  ExampleParameterInterceptor.swift
//  LightNetwork
//
//  Created by 童玉龙 on 2024/3/4.
//

import Foundation
import LightNetwork
import Alamofire
class ExampleLightInterceptor: LNNetworkInterceptor {
    init() {}
    
    func interceptor(allow request: LNBaseRequest) -> Bool {
        return true
    }
    
    //show common hud
    func interceptor(start request: LNBaseRequest) {
        print("Request start: \(request.url)")
    }
    
    //hide common hud
    func interceptor(end request: LNBaseRequest) {
        print("Request end: \(request.url)")
    }
    
    /// insert public parameters
    func interceptor(_ request: LNBaseRequest, parameter: Parameters?) -> Parameters? {
        var para : Dictionary<String, Any> = parameter ?? Dictionary<String, Any>.init()
        para["public"] = "test"
        return para
    }
    
    /// insert public headers
    func interceptor(_ request: LNBaseRequest, headerFields: Alamofire.HTTPHeaders?) -> Alamofire.HTTPHeaders? {
        var header = HTTPHeaders();
        headerFields?.dictionary.forEach { header.add(name: $0.key, value: $0.value) }
        header.add(name: "publicHeader", value: "test")
        return header
    }
    
}
