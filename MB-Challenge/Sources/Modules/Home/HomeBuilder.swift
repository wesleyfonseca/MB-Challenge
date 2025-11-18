//
//  HomeBuilder.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

final class HomeBuilder {
    
    func build(routerDelegate: HomeRouterDelegate?) -> HomeViewController {
        let service = NetworkRequestService()
        let viewModel = HomeViewModel(service: service,
                                      router: routerDelegate)
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
