//
//  HomeDetailViewModel.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import Foundation

protocol HomeDetailViewModelDelegate: AnyObject {
    func fetchDataWithSuccess()
    func fetchDataWithError()
}

protocol HomeDetailViewModelProtocol: AnyObject {
    var headerDTO: HomeDetailHeaderDTO? { get }
    var numberOfRows: Int { get }
    
    func fetchData()
    func tableCellDto(row: Int) -> HomeTableCellDTO?
}

final class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    // MARK: - Properties
    
    weak var delegate: HomeDetailViewModelDelegate?
    private let service: NetworkRequestable
    private let exchangeInfoData: HomeExchangeInfoData
    private var finalError: Error?
    
    var headerDTO: HomeDetailHeaderDTO? {
        guard let logo = exchangeInfoData.logo else { return nil }
        return HomeDetailHeaderDTO(logo: logo)
    }
    
    var numberOfRows: Int {
        return 1
    }
    
    // MARK: - Init
    
    init(service: NetworkRequestable,
         exchangeInfoData: HomeExchangeInfoData) {
        self.service = service
        self.exchangeInfoData = exchangeInfoData
    }
    
    // MARK: - Methods
    
    func fetchData() {
        let endpoint = HomeExchangeMapEndpoint(limit: "10")
        delegate?.fetchDataWithSuccess()
//        service.request(endpoint: endpoint) { [weak self] (result: Result<HomeExchangeMapDTO?,
//                                                           NetworkErrorType>) in
//            guard let self else { return }
//            
//            switch result {
//            case .success(let response):
//                guard let response else {
//                    delegate?.fetchDataWithError()
//                    print("Failure. Empty MapList")
//                    return
//                }
////                exchangeMapData = response
//                fetchInfoExchanges(mapResponse: response)
//                
//            case .failure(let error):
//                delegate?.fetchDataWithError()
//                print("Failure to load \(error.localizedDescription)")
//            }
//        }
    }
    
    func tableCellDto(row: Int) -> HomeTableCellDTO? {
        return nil
//        guard
//            let item = exchangeInfoData,
//            let logo = Array(item.data.values)[row].logo,
//            let name = Array(item.data.values)[row].name,
//            let dateLaunched = Array(item.data.values)[row].dateLaunched
//        else { return nil }
//        
//        let spotVolume = Array(item.data.values)[row].spotVolume
//        return HomeTableCellDTO(logo: logo,
//                                title: name,
//                                spotVolume: spotVolume.formatToUSD() ?? "US$ Unknown",
//                                dateLaunched: "Launched: \(dateLaunched.convertToMMDDYYYY())")
    }
    
    // MARK: - Private Methods
    
    private func fetchInfoExchanges(mapResponse: HomeExchangeMapDTO) {
        let ids = mapResponse.data.compactMap({ String($0.id) })
        let endpoint = HomeExchangeInfoEndpoint(ids: ids)
        service.request(endpoint: endpoint) { [weak self] (result: Result<HomeExchangeInfoDTO?,
                                                           NetworkErrorType>) in
            guard let self else { return }
            
            switch result {
            case .success(let response):
//                exchangeInfoData = response
                delegate?.fetchDataWithSuccess()
                
            case .failure(let error):
                delegate?.fetchDataWithError()
                print("Failure to load \(error.localizedDescription)")
            }
        }
    }
}
