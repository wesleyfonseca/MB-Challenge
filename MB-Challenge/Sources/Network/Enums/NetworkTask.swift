//
//  NetworkTask.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

enum NetworkTask {
    case requestPlain
    case requestParameters(parameters: [String: Any])
}
