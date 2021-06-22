//
//  GetWeather.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

class WeatherService {
    
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    func GetWeather(callback: @escaping (Bool, WeatherData?) -> Void) {
        let baseString = "http://api.openweathermap.org/data/2.5/weather?"
        let accessKey = "&appid=0357d1c81a423e0469bfc903073c03ec"
        let cityName = "q=\(name)"
        let URLString = baseString + cityName + accessKey
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let result = try JSONDecoder().decode(WeatherAPI.self, from: data)
                            var weatherData = WeatherData(name: result.name, temp: result.main.temp, tempMin: result.main.temp_min, tempMax: result.main.temp_max, country: result.sys.country)
                            weatherData.Convertion()
                            callback(true, weatherData)
                            
                        } catch {
                            print(error.localizedDescription)
                            callback(false, nil)
                        }
                        
                        if let error = error {
                            print(error.localizedDescription)
                            callback(false, nil)
                        }
                    }
                }
      
            }.resume()
            
            
           
            
        }
    }
    
   
    
}
