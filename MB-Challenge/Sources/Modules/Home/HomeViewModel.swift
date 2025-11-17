//
//  HomeViewModel.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

protocol HomeRouterDelegate: AnyObject {
    func routeToHomeDetail()
}

protocol HomeViewModelProtocol: AnyObject {
    func fetchData()
}

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    
    private let service: NetworkRequestable
    private weak var router: HomeRouterDelegate?
    
    // MARK: - Init
    
    init(service: NetworkRequestable,
         router: HomeRouterDelegate?) {
        self.service = service
        self.router = router
    }
    
    // MARK: - Methods
    
    func fetchData() {
        
    }
}
