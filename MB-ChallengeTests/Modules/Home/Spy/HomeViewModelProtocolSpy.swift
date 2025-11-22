//
//  HomeViewModelProtocolSpy.swift
//  MB-ChallengeTests
//
//  Created by Wésley Fonseca on 22/11/25.
//

import Foundation
@testable import MB_Challenge

final class HomeViewModelProtocolSpy: HomeViewModelProtocol {
    
    // MARK: - Properties
    
    var numberOfRows: Int = 1
    var tableCellDtoReturn: HomeTableCellDTO? = HomeTableCellDTO(logo: "Logo Mock",
                                                                 title: "Name Mock",
                                                                 spotVolume: "US$ 12.345,00",
                                                                 dateLaunched: "04/04/2010 MOCK")
    
    private(set) var fetchDataCalled = false
    private(set) var tableCellDtoCalled = false
    private(set) var didSelectRowAtCalled = false
    
    // MARK: - Methods
    
    func fetchData() {
        fetchDataCalled = true
    }
    
    func tableCellDto(row: Int) -> HomeTableCellDTO? {
        tableCellDtoCalled = true
        return tableCellDtoReturn
    }
    
    func didSelectRowAt(row: Int) {
        didSelectRowAtCalled = true
    }
}
