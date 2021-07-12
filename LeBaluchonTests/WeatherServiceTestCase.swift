//
//  WeatherServiceTestCase.swift
//  LeBaluchonTests
//
//  Created by Farid Benjomaa on 12/07/2021.
//

@testable import LeBaluchon
import XCTest

class WeatherServiceTestCase: XCTestCase {

    func testGetWeatherByCitySouldPostFailedCallbackIfError(){
        //Given
        
        
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.init().WeatherCorrectData, response: nil, error: FakeResponseData.init().weatherError),
                iconSession: URLSessionFake(data: nil, response: nil, error: nil))
         
        //when
        let expectation = XCTestExpectation(description: "Attendre le changement de queue.")
        weatherService.getWeatherByCity { (succes, weatherData) in
            //Then
            XCTAssertFalse(succes)
             XCTAssertNil(weatherData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherByLocationSouldPostFailedCallbackIfError(){
        //Given
        
        
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.init().WeatherCorrectData, response: nil, error: FakeResponseData.init().weatherError),
                iconSession: URLSessionFake(data: nil, response: nil, error: nil))
         
        //when
        let expectation = XCTestExpectation(description: "Attendre le changement de queue.")
        weatherService.getWeatherByLocation { (succes, weatherData) in
            //Then
            XCTAssertFalse(succes)
             XCTAssertNil(weatherData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherByLocationSouldPostFailedCallbackIfNoData(){
        //Given
        
        
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: nil, response: nil, error: nil),
                iconSession: URLSessionFake(data: nil, response: nil, error: nil))
         
        //when
        let expectation = XCTestExpectation(description: "Attendre le changement de queue.")
        weatherService.getWeatherByLocation { (succes, weatherData) in
            //Then
            XCTAssertFalse(succes)
             XCTAssertNil(weatherData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherByLocationSouldPostFailedCallbackIfIncorectResponse(){
        //Given
        
        
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.init().WeatherCorrectData, response: FakeResponseData.init().responseKO, error: nil),
                iconSession: URLSessionFake(data: nil, response: nil, error: nil))
         
        //when
        let expectation = XCTestExpectation(description: "Attendre le changement de queue.")
        weatherService.getWeatherByLocation { (succes, weatherData) in
            //Then
            XCTAssertFalse(succes)
             XCTAssertNil(weatherData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
}
