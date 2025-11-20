//
//  HomeExchangeInfoDTO.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import Foundation

struct HomeExchangeInfoDTO: Codable {
    let data: [String: HomeExchangeInfoData]
}

struct HomeExchangeInfoData: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case logo
        case name
        case description
        case urls
        case makerFee = "maker_fee"
        case takerFee = "taker_fee"
        case dateLaunched = "date_launched"
        case spotVolume = "spot_volume_usd"
    }
    
    let id: Int?
    let logo: String?
    let name: String?
    let description: String?
    let urls: HomeExchangeInfoUrlData?
    let makerFee: Double?
    let takerFee: Double?
    let dateLaunched: String?
    let spotVolume: Double?
}

struct HomeExchangeInfoUrlData: Codable {
    let website: [String]?
    let twitter: [String]?
    let blog: [String]?
    let chat: [String]?
    let fee: [String]?
}
