//
//  MoviesAPI.swift
//  Hakan
//
//  Created by Hakan UNAL on 27.02.2021.
//

import Foundation
import Alamofire
import RxSwift

open class MoviesAPI {
    open class func now_playingGet(completion: @escaping ((_ data: Movies?,_ error: Error?) -> Void)) {
        now_playingGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }
    
    open class func now_playingGet() -> Observable<Movies> {
        return Observable.create { observer -> Disposable in
            now_playingGet() { data, error in
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
    
    open class func now_playingGetWithRequestBuilder() -> RequestBuilder<Movies> {
        let path = "/3/movie/now_playing"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)
        
        let requestBuilder: RequestBuilder<Movies>.Type = ClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    open class func upcomingGet(completion: @escaping ((_ data: Movies?,_ error: Error?) -> Void)) {
        upcomingGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }
    
    open class func upcomingGet() -> Observable<Movies> {
        return Observable.create { observer -> Disposable in
            upcomingGet() { data, error in
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
    
    open class func upcomingGetWithRequestBuilder() -> RequestBuilder<Movies> {
        let path = "/3/movie/upcoming"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)
        
        let requestBuilder: RequestBuilder<Movies>.Type = ClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    open class func movieGet(movie_id: Int? = nil, completion: @escaping ((_ data: GetMovie?,_ error: Error?) -> Void)) {
        movieGetWithRequestBuilder(movie_id: movie_id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }
    
    open class func movieGet(movie_id: Int? = nil) -> Observable<GetMovie> {
        return Observable.create { observer -> Disposable in
            movieGet(movie_id: movie_id) { data, error in
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
    
    open class func movieGetWithRequestBuilder(movie_id: Int? = nil) -> RequestBuilder<GetMovie> {
        let path = "/3/movie/" + String(movie_id ?? 0)
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)
        
        let requestBuilder: RequestBuilder<GetMovie>.Type = ClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
    
    open class func movieGetSimilar(movie_id: Int? = nil, completion: @escaping ((_ data: SearchMovies?,_ error: Error?) -> Void)) {
        movieGetSimilarWithRequestBuilder(movie_id: movie_id).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }
    
    open class func movieGetSimilar(movie_id: Int? = nil) -> Observable<SearchMovies> {
        return Observable.create { observer -> Disposable in
            movieGetSimilar(movie_id: movie_id) { data, error in
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
    
    open class func movieGetSimilarWithRequestBuilder(movie_id: Int? = nil) -> RequestBuilder<SearchMovies> {
        let path = "/3/movie/" + String(movie_id ?? 0) + "/similar"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        let url = URLComponents(string: URLString)
        
        let requestBuilder: RequestBuilder<SearchMovies>.Type = ClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }
}
