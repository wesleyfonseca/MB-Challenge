//
//  NetworkRequestableSpy.swift
//  MB-ChallengeTests
//
//  Created by Wésley Fonseca on 22/11/25.
//

import Foundation
import XCTest
@testable import MB_Challenge

final class NetworkRequestableSpy: NetworkRequestable {
    
    // MARK: - Properties
    
    private(set) var requestCalled = false
    
    var responsesQueue: [Result<Data?, NetworkErrorType>] = []
    
    // MARK: - Methods
    
    func request<DataType>(
        endpoint: NetworkEndpoint,
        completion: @escaping (Result<DataType?, NetworkErrorType>) -> Void)
    where DataType: Decodable, DataType: Encodable {
        requestCalled = true
        
        guard !responsesQueue.isEmpty else {
            completion(.failure(.unknown))
            return
        }
        
        let next = responsesQueue.removeFirst()
        
        switch next {
        case .failure(let error):
            completion(.failure(error))
            
        case .success(let data):
            guard let data else {
                completion(.success(nil))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(DataType.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingError))
            }
        }
    }
    
    func enqueue(response: Result<Data?, NetworkErrorType>) {
        responsesQueue.append(response)
    }
}
