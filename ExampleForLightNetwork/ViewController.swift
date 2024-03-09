//
//  ViewController.swift
//  ExampleForLightNetwork
//
//  Created by 童玉龙 on 2024/3/7.
//

import UIKit
import LightNetwork
class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config()
    }
    
    func config() {
        var config = LNNetworkConfiguration(baseURL: URL(string: "http://localhost:3001/"))
        config.networkInterceptor = ExampleLightInterceptor.init()
        LNNetworkManager.default.configuration = config
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            ExampleRequest.goodsDetail(goodsId: "2313") { request, responseData in
                print("Success:\(responseData)")
            } failure: { request, errorDescription in
                print("Failure:\(errorDescription)")
            }
        case 1:
            ExampleRequest.modify(userName: "Light") { request, responseData in
                print("Success:\(responseData)")
            } failure: { request, errorDescription in
                print("Failure:\(errorDescription)")
            }
        case 2:
            ExampleRequest.delete { request, responseData in
                print("Success:\(responseData)")
            } failure: { request, errorDescription in
                print("Failure:\(errorDescription)")
            }
            
        case 3:
            ExampleDownloadRequest.download(video: "video") { progress in
                print("download progress:\(progress.fractionCompleted)")
            } success: { request, responseData in
                print("Success:\(responseData)")
            } failure: { request, errorDescription in
                print("Failure:\(errorDescription)")
            }
        case 4:
            
            guard let path = Bundle.main.path(forResource: "earth", ofType: "jpg") else { return }
            guard let image = UIImage(contentsOfFile: path) else { return }
            ExampleUploadRequest.uploadImage(image: image) { progress in
                print("download progress:\(progress.fractionCompleted)")
            } success: { request, responseData in
                print("Success:\(responseData)")
            } failure: { request, errorDescription in
                print("Failure:\(errorDescription)")
            }
        case 5 :
            ExampleCacheTestRequest.goodsDetail(goodsId: "2313") { request, responseData in
                print("Success:\(responseData)")
            } failure: { request, errorDescription in
                print("Failure:\(errorDescription)")
            }
            
        default:
            break
        }
    }

}

