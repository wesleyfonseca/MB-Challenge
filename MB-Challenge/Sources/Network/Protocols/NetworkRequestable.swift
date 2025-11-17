//
//  NetworkRequestable.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

protocol NetworkRequestable: AnyObject {
    func request<DataType: Codable>(
        endpoint: NetworkEndpoint,
        completion: @escaping (Result<DataType?, NetworkErrorType>) -> Void
    )
}
