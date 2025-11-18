//
//  Environment.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

protocol EnvironmentProtocol: AnyObject {
    var domainURL: URL { get }
}

final class Environment: EnvironmentProtocol {
    var domainURL: URL {
        if let domainURL = URL(string: "https://pro-api.coinmarketcap.com") {
            return domainURL
        } else {
            preconditionFailure("It`s not a valid url")
        }
    }
}
