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

protocol HomeViewModelDelegate: AnyObject {
    func fetchDataWithSuccess()
    func fetchDataWithError()
}

protocol HomeViewModelProtocol: AnyObject {
    func fetchData()
}

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    
    weak var delegate: HomeViewModelDelegate?
    private weak var router: HomeRouterDelegate?
    private let service: NetworkRequestable
    private var exchangeMapData: HomeExchangeMapDTO?
    
    // MARK: - Init
    
    init(service: NetworkRequestable,
         router: HomeRouterDelegate?) {
        self.service = service
        self.router = router
    }
    
    // MARK: - Methods
    
    func fetchData() {
        let endpoint = HomeExchangeMapEndpoint()
        service.request(endpoint: endpoint) { [weak self] (result: Result<HomeExchangeMapDTO?,
                                                           NetworkErrorType>) in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                exchangeMapData = response
                delegate?.fetchDataWithSuccess()
                
            case .failure(let error):
                delegate?.fetchDataWithError()
                print("Failure to load \(error.localizedDescription)")
            }
        }
    }
}
