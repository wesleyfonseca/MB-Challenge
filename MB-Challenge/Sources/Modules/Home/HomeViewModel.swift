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
    private var exchangeInfoData: HomeExchangeInfoDTO?
    private var finalError: Error?
    
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
                guard let response else {
                    delegate?.fetchDataWithError()
                    print("Failure. Empty MapList")
                    return
                }
                exchangeMapData = response
                fetchInfoExchanges(mapResponse: response)
                
            case .failure(let error):
                delegate?.fetchDataWithError()
                print("Failure to load \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchInfoExchanges(mapResponse: HomeExchangeMapDTO) {
        let ids = mapResponse.data.compactMap({ String($0.id) })
        let endpoint = HomeExchangeInfoEndpoint(ids: ids)
        service.request(endpoint: endpoint) { [weak self] (result: Result<HomeExchangeInfoDTO?,
                                                           NetworkErrorType>) in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                exchangeInfoData = response
                delegate?.fetchDataWithSuccess()
                
            case .failure(let error):
                delegate?.fetchDataWithError()
                print("Failure to load \(error.localizedDescription)")
            }
        }
    }
}
