//
//  Weather.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 22/06/2021.
//

import Foundation

struct WeatherData {
    
    var name : String
    var temp : Double
    var tempMin : Double
    var tempMax : Double
    var country : String
    var temperature = "0.0"
    var temperatureMin = "0.0"
    var temperatureMax = "0.0"
    var weather : [Weather]
    var icon : Data
    var image : String?
    
    
    
    func convertKelvinInCelcuis(kelvin : Double) -> String{
        let celsius = kelvin - 273.15
        let celsiusRound = String(format:"%.1f", celsius)
        return celsiusRound
    }
    
    mutating func Convertion () {
        
      temperature = convertKelvinInCelcuis(kelvin: temp)
      temperatureMin = convertKelvinInCelcuis(kelvin: tempMin)
      temperatureMax = convertKelvinInCelcuis(kelvin: tempMax)
    }
     
 
    
}
