//
//  NetworkAdapter.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

struct NetworkAdapter {
    
    static let provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.neverStub ,
                                                    plugins: [
                                                        NetworkLoggerPlugin(),
                                                        NetworkActivityPlugin(networkActivityClosure: networkActivityClosure)
        ])
    
    
    static let networkActivityClosure: NetworkActivityPlugin.NetworkActivityClosure = { change, arg  in
            switch change{
                case .began:
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                case .ended:
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
    }
    
    static func request(
        target: MultiTarget,
        success successCallback: @escaping (_ json: String) -> Void,
        error errorCallback: @escaping (ErrorDTO) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ){
        
        provider.request(target) { (result) in
            switch result{
            case .success(let response):
                do{
                    _ = try response.filterSuccessfulStatusCodes()
                    let  json = try response.mapString()
                    successCallback(json)
                }catch{
                    if response.statusCode != 200{
                        NotificationCenter.default.post(name: Notification.Name(Constants.Notification.networkError), object: nil)
                    }
                    let  errorJson = try? response.mapString()
                    if errorJson != nil && errorJson != ""{
                        let error = Mapper<ErrorDTO>().map(JSONString: errorJson!)
                        errorCallback(error!)
                    }else{
                        print("PARSINNG ERROR!!!")
                        errorCallback(ErrorDTO())
                    }
                    
                }
            case .failure(let error):
                NotificationCenter.default.post(name: Notification.Name(Constants.Notification.networkError), object: nil)
                failureCallback(error)
            }
        }
    }
}

