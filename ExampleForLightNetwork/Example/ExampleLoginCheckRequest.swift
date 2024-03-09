//
//  LNLoginCheckRequest.swift
//  LightNetwork
//
//  Created by 童玉龙 on 2024/3/4.
//

import Foundation
import Alamofire
import LightNetwork
class ExampleLoginCheckRequest : LNBaseRequest {
    
    override var allowRequest: Bool  {
        let login = NSNumber(value: 0).boolValue
        //if account is not login, do something
        return login
    }
}
