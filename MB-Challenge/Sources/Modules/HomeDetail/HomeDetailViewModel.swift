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
    func tableCellDto(row: Int) -> HomeDetailTableCellDTO?
}

final class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    // MARK: - Properties
    
    weak var delegate: HomeDetailViewModelDelegate?
    private let service: NetworkRequestable
    private let exchangeInfoData: HomeExchangeInfoData
    private var assetsDTO: HomeDetailExchangeAssetsDTO?
    private var infoCryptoDTO: HomeCryptoCurrencyInfoDTO?
    
    var headerDTO: HomeDetailHeaderDTO? {
        guard let logo = exchangeInfoData.logo else { return nil }
        return HomeDetailHeaderDTO(logo: logo)
    }
    
    var numberOfRows: Int {
        guard let infoCryptoDTO else { return .zero }
        
        return infoCryptoDTO.data.count
    }
    
    // MARK: - Init
    
    init(service: NetworkRequestable,
         exchangeInfoData: HomeExchangeInfoData) {
        self.service = service
        self.exchangeInfoData = exchangeInfoData
    }
    
    // MARK: - Methods
    
    func fetchData() {
        guard let id = exchangeInfoData.id else { return }
        let endpoint = HomeExchangeAssetsEndpoint(id: String(id))
        service.request(endpoint: endpoint) { [weak self] (result: Result<HomeDetailExchangeAssetsDTO?,
                                                           NetworkErrorType>) in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                guard let response else {
                    print("Failure. Empty Assets")
                    return
                }
                assetsDTO = response
                fetchInfoCrypto(assetResponse: response)
                
            case .failure(let error):
                delegate?.fetchDataWithError()
                print("Failure to load \(error.localizedDescription)")
            }
        }
    }
    
    func tableCellDto(row: Int) -> HomeDetailTableCellDTO? {
        guard
            let asset = assetsDTO,
            let id = asset.data[row].currency?.id,
            let logo = infoCryptoDTO?.data[String(id)]?.logo,
            let name = asset.data[row].currency?.name
        else { return nil }
        
        let price = asset.data[row].currency?.price
        return HomeDetailTableCellDTO(logo: logo,
                                      title: name,
                                      subtitle: price.formatToUSD() ?? "US$ Unknown")
    }
    
    // MARK: - Private Methods
    
    private func fetchInfoCrypto(assetResponse: HomeDetailExchangeAssetsDTO) {
        let ids: [String] = assetResponse.data.compactMap { asset in
            guard let id = asset.currency?.id else { return nil }
            return String(id)
        }
        
        guard !ids.isEmpty else {
            delegate?.fetchDataWithSuccess()
            return
        }
        
        let endpoint = HomeCryptoCurrencyInfoEndpoint(ids: ids)
        service.request(endpoint: endpoint) { [weak self] (result: Result<HomeCryptoCurrencyInfoDTO?,
                                                           NetworkErrorType>) in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                infoCryptoDTO = response
                delegate?.fetchDataWithSuccess()
                
            case .failure(let error):
                delegate?.fetchDataWithError()
                print("Failure to load \(error.localizedDescription)")
            }
        }
    }
}
