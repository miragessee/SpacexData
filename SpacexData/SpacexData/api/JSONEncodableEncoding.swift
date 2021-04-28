//
//  JSONEncodableEncoding.swift
//  Hakan
//
//  Created by Hakan UNAL on 27.02.2021.
//

import Foundation
import Alamofire

public struct JSONDataEncoding: ParameterEncoding {

    private static let jsonDataKey = "jsonData"

    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()

        guard let jsonData = parameters?[JSONDataEncoding.jsonDataKey] as? Data, !jsonData.isEmpty else {
            return urlRequest
        }

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        urlRequest.httpBody = jsonData

        return urlRequest
    }

    public static func encodingParameters(jsonData: Data?) -> Parameters? {
        var returnedParams: Parameters? = nil
        if let jsonData = jsonData, !jsonData.isEmpty {
            var params = Parameters()
            params[jsonDataKey] = jsonData
            returnedParams = params
        }
        return returnedParams
    }
}
