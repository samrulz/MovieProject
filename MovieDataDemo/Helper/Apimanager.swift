//
//  Apimanager.swift
//  MovieDataDemo
//
//  Created by SAGAR THAKARE on 29/12/18.
//  Copyright © 2018 Sandip Musale. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD


class Connectivity {
    class var isConnectedToInternet:Bool{
        return (NetworkReachabilityManager()?.isReachable)!
    }
}

public func requestGetUrl(url:String,params:[String:Any]?,headers:HTTPHeaders?,success:@escaping(Data?)->Void,failure:@escaping(Error)->Void){
    SVProgressHUD.show()
    SVProgressHUD.setForegroundColor(.blue)
    SVProgressHUD.setBackgroundColor(.clear)
    SVProgressHUD.setDefaultMaskType(.clear)
    
    
    guard Connectivity.isConnectedToInternet else {
        SVProgressHUD.dismiss()
        return
    }
    
    
    
    Alamofire.request(url, method:.get, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) in
        //print(responseObject)
        guard let status = responseObject.response?.statusCode else{return}
        
        switch(status){
        case 200:
            SVProgressHUD.dismiss()
            print("example success")
        default:
            print("error with response status: \(status)")
        }
        
        switch responseObject.result{
        case .success(_):
            SVProgressHUD.dismiss()
            guard let data = responseObject.data  else{return}
            
            let jsonDic = data
            success(jsonDic)
            break
            
        case .failure(_):
            SVProgressHUD.dismiss()
            let error = responseObject.result.error!
            failure(error)
            break
        }
    }
    
}
