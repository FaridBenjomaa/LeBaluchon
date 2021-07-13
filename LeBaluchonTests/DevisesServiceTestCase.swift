//
//  DevisesServiceTestCase.swift
//  LeBaluchonTests
//
//  Created by Farid Benjomaa on 12/07/2021.
//
@testable import LeBaluchon
import XCTest

class DevisesServiceTestCase: XCTestCase {

    func testGetDevisePostFailledCallbackifError(){
       
        let deviseService = DeviseService(deviseSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.init().deviseError), deviseName : "USD", devise : 1.185206 )
    
            
        
        
        deviseService.getDevise{ (success, deviseDta) in
            
            XCTAssertFalse(success)
            XCTAssertNil(deviseDta)
           
        }
        
    }
    
    
    func testGetDevisePostFailledCallbackifNoData(){
       
        let deviseService = DeviseService(deviseSession: URLSessionFake(data: nil, response: nil, error: nil), deviseName : "USD", devise : 1.185206 )
            
        
        
        deviseService.getDevise{ (success, deviseDta) in
            
            XCTAssertFalse(success)
            XCTAssertNil(deviseDta)
           
        }
        
    }

    func testGetDevisePostFailledCallbackifIncorrectResponse(){
       
        let deviseService = DeviseService(deviseSession: URLSessionFake(data: FakeResponseData.init().DeviseCorrectData, response: FakeResponseData.init().responseKO, error: nil), deviseName : "USD", devise : 1.185206 )
            
        
        
        deviseService.getDevise{ (success, deviseDta) in
            
            XCTAssertFalse(success)
            XCTAssertNil(deviseDta)
           
        }
        
    }
    
    func testGetDevisePostFailledCallbackifIncorrectData(){
       
        let deviseService = DeviseService(deviseSession: URLSessionFake(data: FakeResponseData.init().deviseIncorrectData, response: FakeResponseData.init().responseOK, error: nil), deviseName : "USD", devise : 1.185206 )
            
        
        
        deviseService.getDevise{ (success, deviseDta) in
            
            XCTAssertFalse(success)
            XCTAssertNil(deviseDta)
           
        }
        
    }
    
    func testGetDevisePostSuccessCallbackifNoDaErrorAndCorrectData(){
       
        let deviseService = DeviseService(deviseSession: URLSessionFake(data: FakeResponseData.init().DeviseCorrectData, response: FakeResponseData.init().responseOK, error: nil), deviseName : "USD", devise : 1.185206 )
        
        
        deviseService.getDevise { (success, weatherData) in
      
     
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherData)
          
           
        }
        
    }

}
