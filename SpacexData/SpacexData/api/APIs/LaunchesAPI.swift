//
//  LaunchesAPI.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation
import Alamofire
import RxSwift

open class LaunchesAPI {
    open class func getLaunches(completion: @escaping ((_ data: LaunchesModel?,_ error: Error?) -> Void)) {
        getLaunchesWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }
    
    open class func getLaunches() -> Observable<LaunchesModel> {
        return Observable.create { observer -> Disposable in
            getLaunches() { data, error in
                if let error = error {
                    observer.on(.error(error))
                } else {
                    observer.on(.next(data!))
                }
                observer.on(.completed)
            }
            return Disposables.create()
        }
    }
    
    open class func getLaunchesWithRequestBuilder() -> RequestBuilder<LaunchesModel> {
        let path = "/launches"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)
        
        let requestBuilder: RequestBuilder<LaunchesModel>.Type = ClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
