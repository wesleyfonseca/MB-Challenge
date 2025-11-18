//
//  NetworkEndpoint.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

protocol NetworkEndpoint: AnyObject {
    var baseURL: URL { get }
    var path: String { get }
    var method: NetworkMethod { get }
    var task: NetworkTask { get }
    var headers: [String: String] { get }
}

extension NetworkEndpoint {
    func createRequest() -> NSMutableURLRequest? {
        guard let requestURL = createURL() else { return nil }
        
        let request = NSMutableURLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 20
        headers.forEach({ request.setValue($0.value,
                                           forHTTPHeaderField: $0.key) })
        return request
    }
    
    private func createURL() -> URL? {
        switch task {
        case .requestPlain:
            return urlWithParameters([:])
            
        case .requestParameters(let parameters):
            return urlWithParameters(parameters)
        }
    }
    
    private func urlWithParameters(_ parameters: [String: Any]) -> URL? {
        var requestURL = URLComponents()
        requestURL.scheme = baseURL.scheme
        requestURL.host = baseURL.host
        requestURL.port = baseURL.port
        requestURL.path = path
        
        if !baseURL.path.isEmpty {
            requestURL.path = baseURL.path + requestURL.path
        }
        
        if !parameters.isEmpty {
            requestURL.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        return requestURL.url
    }
}
