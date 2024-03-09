//
//  ExampleRequest.swift
//  LightNetwork
//
//  Created by 童玉龙 on 2024/3/4.
//

import Foundation
import Alamofire
import LightNetwork
import UIKit

struct URLPath {
    static let query : String = "/query"
    static let goods : String = "/goods"
}

class ExampleRequest : ExampleBaseRequest {

    class func goodsDetail(goodsId:String,success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        //wirte the path directly or using static string
        self.get(path: URLPath.goods, parameters: ["goodsId":goodsId], success: success, failure: failure)
    }
    
    class func modify(userName:String,success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        self.post(path: "/modify", parameters: ["userName":userName], success: success, failure: failure)
    }
    
    class func delete(success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        self.request(path: "/delete",method: .delete, success: success, failure: failure)
    }
}

class ExampleCacheTestRequest : ExampleBaseRequest {
    
    override func prepare() {
        //set cachePolicy
        //只有在cache中不存在data时才从原始地址下载。
        cachePolicy = .returnCacheDataElseLoad
    }
    
    class func goodsDetail(goodsId:String,success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        self.get(path: URLPath.goods, parameters: ["goodsId":goodsId], success: success, failure: failure)
    }
    
}

class ExampleUploadRequest : ExampleBaseRequest {
    
    class func uploadImage(image :UIImage,progress : @escaping Alamofire.Request.ProgressHandler, success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        let imageName : String = "earth.jpg"
        self.upload(path: "/uploadimage", method: .post, parameters: ["type":"jpg"], multipartFormData: { multipartFormData in
            
            if let data = image.pngData() {
                multipartFormData.append(data, withName: imageName, mimeType: "image/jpeg")
            }
        },success: success,failure:failure)?
            .uploadProgress(closure: progress)

    }
    
}

class ExampleDownloadRequest : ExampleBaseRequest {
    class func download(video : String, progress : @escaping Alamofire.Request.ProgressHandler, success: @escaping LNRequestSuccess, failure:@escaping LNRequestFailure) {
        let req = self.download(path: "/download",method: .post,parameters: ["video":video], success:success, failure: failure)?.downloadProgress(closure: progress)
        //cancel request
        //req?.cancel()
    }
}



