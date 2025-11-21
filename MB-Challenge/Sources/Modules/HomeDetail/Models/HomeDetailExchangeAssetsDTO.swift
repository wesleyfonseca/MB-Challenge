//
//  HomeDetailExchangeAssetsDTO.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import Foundation

struct HomeDetailExchangeAssetsDTO: Codable {
    let data: [HomeDetailExchangeAssetsData]
}

struct HomeDetailExchangeAssetsData: Codable {
    let currency: HomeDetailExchangeAssetsCurrency?
}

struct HomeDetailExchangeAssetsCurrency: Codable {
    enum CodingKeys: String, CodingKey {
        case price = "price_usd"
        case id = "crypto_id"
        case name
    }
    
    let price: Double?
    let id: Int?
    let name: String?
}
