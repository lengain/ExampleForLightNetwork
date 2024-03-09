//
//  LNSecondBaseRequest.swift
//  LightNetwork
//
//  Created by 童玉龙 on 2024/3/4.
//

import Foundation
import LightNetwork

public class ExampleOtherBaseURLNetwork {
    
    public static let `default` = ExampleOtherBaseURLNetwork()
    var manager : LNNetworkManager
    
    init() {
        var config = LNNetworkConfiguration(baseURL:  URL(string: "https://www.github.com/"))
        self.manager = LNNetworkManager.init(configuration: config)
        self.manager.configuration.debugLevel = LNNetworkManager.default.configuration.debugLevel
    }
}


class LNSecondBaseRequest : LNRequest {
    override var manager: LNNetworkManager {
        ExampleOtherBaseURLNetwork.default.manager
    }
}

class ExampleSBRequest : LNSecondBaseRequest {
    class func modify(userName:String,success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        self.post(path: "/modify", parameters: ["userName":userName], success: success, failure: failure)
    }
}
