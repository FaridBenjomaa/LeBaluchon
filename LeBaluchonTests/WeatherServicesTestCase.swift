//
//  WeatherServicesTestCase.swift
//  LeBaluchonTests
//
//  Created by Farid Benjomaa on 12/07/2021.
//
@testable import LeBaluchon
import XCTest

class WeatherServicesTestCase: XCTestCase {

   
    
    
    func testGetWeatherByCityPostFailledCallbackifError(){
       
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.init().weatherError),
            iconSession: URLSessionFake(data: nil, response: nil, error: nil),
            name: "Miami")
        
        
        weatherService.getWeatherByCity { (success, weatherData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(weatherData)
           
        }
        
    }
    
    func testGetWeatherByLocationPostFailledCallbackifError(){
       
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.init().weatherError),
            iconSession: URLSessionFake(data: nil, response: nil, error: nil),
            lat: 48.7448,
            lon: 2.4871)
        
        
        weatherService.getWeatherByLocation { (success, weatherData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(weatherData)
           
        }
        
    }
    
    func testGetWeatherByCityPostFailledCallbackifNoData(){
       
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: nil, response: nil, error: nil),
            iconSession: URLSessionFake(data: nil, response: nil, error: nil),
            name: "Miami")
        
        
        weatherService.getWeatherByCity { (success, weatherData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(weatherData)
           
        }
        
    }

    func testGetWeatherByCityPostFailledCallbackifIncorrectResponse(){
       
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.init().WeatherCorrectData, response: FakeResponseData.init().responseKO, error: nil),
            iconSession: URLSessionFake(data: nil, response: nil, error: nil),
            name: "Miami")
        
        
        weatherService.getWeatherByCity { (success, weatherData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(weatherData)
           
        }
        
    }
    
    func testGetWeatherByCityPostFailledCallbackifIncorrectData(){
       
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.init().weatherIncorrectData, response: FakeResponseData.init().responseOK, error: nil),
            iconSession: URLSessionFake(data: nil, response: nil, error: nil),
            name: "Miami")
        
        
        weatherService.getWeatherByCity { (success, weatherData) in
            
            XCTAssertFalse(success)
            XCTAssertNil(weatherData)
           
        }
        
    }
    
    func testGetWeatherByCityPostSuccessCallbackifNoDaErrorAndCorrectData(){
       
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.init().WeatherCorrectData, response: FakeResponseData.init().responseOK, error: nil),
            iconSession: URLSessionFake(data: FakeResponseData.init().iconData, response: FakeResponseData.init().responseOK, error: nil),
            name: "Miami")
        
        
        weatherService.getWeatherByCity { (success, weatherData) in
            let    temp = 299.74
            let tempMin =  296.73
            let tempMax = 301.25
            
            let temperature = weatherData?.convertKelvinInCelcuis(kelvin: temp)
            let temperatureMin = weatherData?.convertKelvinInCelcuis(kelvin: tempMin)
            let temperatureMax = weatherData?.convertKelvinInCelcuis(kelvin: tempMax)
    
            let iconData = "image".data(using: .utf8)!
            
            
            XCTAssertTrue(success)
            XCTAssertNotNil(weatherData)
            XCTAssertEqual(temperature,weatherData?.temperature)
            XCTAssertEqual(temperatureMin,weatherData?.temperatureMin)
            XCTAssertEqual(temperatureMax,weatherData?.temperatureMax)
            XCTAssertEqual(iconData,weatherData?.icon)
           
        }
        
    }
    
    
}
