//
//  HomeDetailBuilder.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import Foundation

final class HomeDetailBuilder {
    
    func build(exchangeInfoData: HomeExchangeInfoData) -> HomeDetailViewController {
        let service = NetworkRequestService()
        let viewModel = HomeDetailViewModel(service: service,
                                            exchangeInfoData: exchangeInfoData)
        let viewController = HomeDetailViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
