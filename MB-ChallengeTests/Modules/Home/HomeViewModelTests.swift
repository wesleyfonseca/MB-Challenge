//
//  HomeViewModelTests.swift
//  MB-ChallengeTests
//
//  Created by Wésley Fonseca on 22/11/25.
//

import Foundation
import XCTest
@testable import MB_Challenge

final class HomeViewModelTests: XCTestCase {
    
    private var sut: HomeViewModel!
    private var serviceSpy: NetworkRequestableSpy!
    private var routerSpy: HomeRouterDelegateSpy!
    private var delegateSpy: HomeViewModelDelegateSpy!
    
    override func setUp() {
        super.setUp()
        
        serviceSpy = NetworkRequestableSpy()
        routerSpy = HomeRouterDelegateSpy()
        delegateSpy = HomeViewModelDelegateSpy()
        sut = HomeViewModel(service: serviceSpy,
                            router: routerSpy)
        sut.delegate = delegateSpy
    }
    
    override func tearDown() {
        super.tearDown()
        serviceSpy = nil
        routerSpy = nil
        delegateSpy = nil
        sut = nil
    }
    
    // MARK: - Tests
    
    func testFetchDataShouldSuccess() {
        let mapDTO = HomeExchangeMapDTO(data: [HomeExchangeMapData(id: 10)])
        let mapData = try! JSONEncoder().encode(mapDTO)
        
        let infoDTO = HomeExchangeInfoDTO(data: ["10" : HomeExchangeInfoData(id: 10,
                                                                             logo: "Logo",
                                                                             name: "Name",
                                                                             description: "Description",
                                                                             urls: nil,
                                                                             makerFee: 0.2,
                                                                             takerFee: 0.3,
                                                                             dateLaunched: "04/04/2010",
                                                                             spotVolume: 12345)])
        let infoData = try! JSONEncoder().encode(infoDTO)
        
        serviceSpy.enqueue(response: .success(mapData))
        serviceSpy.enqueue(response: .success(infoData))
        sut.fetchData()
        
        XCTAssertNotNil(sut.exchangeMapData)
        XCTAssertNotNil(sut.exchangeInfoData)
        XCTAssertTrue(delegateSpy.fetchDataWithSuccessCalled)
    }
    
    func testFetchDataShouldError() {
        sut.fetchData()
        serviceSpy.enqueue(response: .failure(.unknown))
        
        XCTAssertTrue(delegateSpy.fetchDataWithErrorCalled)
    }
    
    func testFetchDataShouldErrorOnInfoExchanges() {
        let mapDTO = HomeExchangeMapDTO(data: [HomeExchangeMapData(id: 10)])
        let mapData = try! JSONEncoder().encode(mapDTO)
        
        sut.fetchData()
        serviceSpy.enqueue(response: .success(mapData))
        serviceSpy.enqueue(response: .failure(.unknown))
        
        XCTAssertTrue(delegateSpy.fetchDataWithErrorCalled)
    }
    
    func testTableCellDtoShouldRenderCell() {
        let mapDTO = HomeExchangeMapDTO(data: [HomeExchangeMapData(id: 10)])
        let mapData = try! JSONEncoder().encode(mapDTO)
        
        let infoDTO = HomeExchangeInfoDTO(data: ["10" : HomeExchangeInfoData(id: 10,
                                                                             logo: "Logo MOCK",
                                                                             name: "Name MOCK",
                                                                             description: "Description MOCL",
                                                                             urls: nil,
                                                                             makerFee: 0.2,
                                                                             takerFee: 0.3,
                                                                             dateLaunched: "04/04/2010 MOCK",
                                                                             spotVolume: 12345)])
        let infoData = try! JSONEncoder().encode(infoDTO)
        
        serviceSpy.enqueue(response: .success(mapData))
        serviceSpy.enqueue(response: .success(infoData))
        sut.fetchData()
        let cellDto = sut.tableCellDto(row: 0)
        
        XCTAssertEqual(cellDto?.logo, "Logo MOCK")
        XCTAssertEqual(cellDto?.title, "Name MOCK")
        XCTAssertEqual(cellDto?.spotVolume, "US$ 12.345,00")
        XCTAssertEqual(cellDto?.dateLaunched, "Launched: 04/04/2010 MOCK")
    }
    
    func testDidSelectRowAtShouldRouteToDetail() {
        let mapDTO = HomeExchangeMapDTO(data: [HomeExchangeMapData(id: 10)])
        let mapData = try! JSONEncoder().encode(mapDTO)
        
        let infoDTO = HomeExchangeInfoDTO(data: ["10" : HomeExchangeInfoData(id: 10,
                                                                             logo: "Logo MOCK",
                                                                             name: "Name MOCK",
                                                                             description: "Description MOCL",
                                                                             urls: nil,
                                                                             makerFee: 0.2,
                                                                             takerFee: 0.3,
                                                                             dateLaunched: "04/04/2010 MOCK",
                                                                             spotVolume: 12345)])
        let infoData = try! JSONEncoder().encode(infoDTO)
        
        serviceSpy.enqueue(response: .success(mapData))
        serviceSpy.enqueue(response: .success(infoData))
        sut.fetchData()
        sut.didSelectRowAt(row: 0)
        
        XCTAssertTrue(routerSpy.routeToHomeDetailCalled)
    }
}
