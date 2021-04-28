//
//  SearchAPI.swift
//  Hakan
//
//  Created by Hakan UNAL on 27.02.2021.
//

import Foundation
import Alamofire
import RxSwift

open class SearchAPI {
    open class func searchMovieGet(query: String? = nil, completion: @escaping ((_ data: SearchMovies?,_ error: Error?) -> Void)) {
        searchMovieGetWithRequestBuilder(query: query).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }
    
    open class func searchMovieGet(query: String? = nil) -> Observable<SearchMovies> {
        return Observable.create { observer -> Disposable in
            searchMovieGet(query: query) { data, error in
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
    
    open class func searchMovieGetWithRequestBuilder(query: String? = nil) -> RequestBuilder<SearchMovies> {
        let path = "/3/search/movie"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "query": query
        ])
        
        
        let requestBuilder: RequestBuilder<SearchMovies>.Type = ClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
