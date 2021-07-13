//
//  TranslationServiceTestCase.swift
//  LeBaluchonTests
//
//  Created by Farid Benjomaa on 12/07/2021.
//
@testable import LeBaluchon
import XCTest

class TranslationServiceTestCase: XCTestCase {

    func testGetTranslationPostFailledCallbackifError(){
       
        let translationService = TranslationService(translateSession:URLSessionFake(data: nil, response: nil, error: FakeResponseData.init().translationeError), quoteText : "Bonjour", language : "en")
        
        translationService.translateApi{ (success, translationData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(translationData)
           
        }
        
    }
    
    func testGetTranslationPostFailledCallbackifNoData(){
       
        let translationService = TranslationService(translateSession:URLSessionFake(data: nil, response: nil, error: nil), quoteText : "Bonjour", language : "en")
        
        translationService.translateApi{ (success, translationData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(translationData)
           
        }
        
    }
    
    func testGetTranslationPostFailledCallbackIfIncorrectResponse(){
       
        let translationService = TranslationService(translateSession:URLSessionFake(data: FakeResponseData.init().DeviseCorrectData, response: FakeResponseData.init().responseKO, error: nil), quoteText : "Bonjour", language : "en")
        
        translationService.translateApi{ (success, translationData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(translationData)
           
        }
        
    }

    
    func testGetTranslationPostFailledCallbackIfIncorrectData(){
       
        let translationService = TranslationService(translateSession:URLSessionFake(data: FakeResponseData.init().deviseIncorrectData, response: FakeResponseData.init().responseOK, error: nil), quoteText : "Bonjour", language : "en")
        
        translationService.translateApi{ (success, translationData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(translationData)
           
        }
        
    }
    
    func testGetTranslationPostSuccessCallbackifNoDataErrorAndCorrectData(){
       
        let translationService = TranslationService(translateSession:URLSessionFake(data: FakeResponseData.init().DeviseCorrectData, response: FakeResponseData.init().responseOK, error: nil), quoteText : "Bonjour", language : "en")
        
        translationService.translateApi{ (success, translationData) in
            
            let translatedText = "hello and welcome home"
     
            
            XCTAssertFalse(success)
            XCTAssertNil(translationData)
            XCTAssertEqual(translatedText, translationData?.translatedText)
           
        }
        
    }
}
