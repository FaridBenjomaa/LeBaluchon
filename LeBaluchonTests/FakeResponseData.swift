//
//  FakeResponseData.swift
//  LeBaluchonTests
//
//  Created by Farid Benjomaa on 12/07/2021.
//

import Foundation

class FakeResponseData {
    let responseOK = HTTPURLResponse(url: URL(string: "http://data.fixer.io/api/latest?access_key=d264f2e52a15ca678edf49b7cc8e86ae")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    let responseKO = HTTPURLResponse(url: URL(string: "http://data.fixer.io/api/latest?access_key=d264f2e52a15ca678edf49b7cc8e86ae")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class DeviseError: Error {
        
    }
    class WeatherError: Error {
        
    }
    class TranslationError: Error {
        
    }
    
    
    let deviseError = DeviseError()
    let weatherError = WeatherError()
    let translationeError = TranslationError()
    
    var DeviseCorrectData : Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "devise", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    var WeatherCorrectData : Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "weather", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    var TranslationCorrectData : Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "translation", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    
    let deviseIncorrectData = "erreur".data(using: .utf8)!
    let weatherIncorrectData = "erreur".data(using: .utf8)!
    let translationIncorrectData = "erreur".data(using: .utf8)!
    let iconData = "image".data(using: .utf8)!
    
}
