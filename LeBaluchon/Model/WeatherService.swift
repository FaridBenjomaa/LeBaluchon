//
//  GetWeather.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

class WeatherService {
    
    var lat : Double?
    var lon : Double?
    var name : String?
    var icon : String?
 
    
    let baseString = "http://api.openweathermap.org/data/2.5/weather?"
    let accessKey = "&appid=0357d1c81a423e0469bfc903073c03ec"
    
    init(name : String){
        self.name = name
    }
    
    init(lat: Double, lon: Double){
        self.lat = lat
        self.lon = lon
    }
    
    func findLocation() -> String {
        let latLong = "lat=\(lat!)&lon=\(lon!)"
        let URLString = baseString + latLong + accessKey
        return URLString
    }
  
    func city() -> String{
        let cityName = "q=\(name!)"
        let URLString = baseString + cityName + accessKey
       return URLString
    }
   
    func GetWeatherByCity(callback: @escaping (Bool, WeatherData?) -> Void) {
    
        let URLString = city()
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let result = try JSONDecoder().decode(WeatherAPI.self, from: data)
                            let name =  result.name
                            let temp = result.main.temp
                            let tempMin = result.main.temp_min
                            let tempMax = result.main.temp_max
                            let country =  result.sys.country
                            let weather =  result.weather
                            self.icon = result.weather[0].icon
                            
             
                                    self.getIcon { (data) in
                                        if let data = data {
                                            var weatherData = WeatherData(name: name, temp: temp, tempMin: tempMin, tempMax: tempMax, country: country, weather: weather, icon: data)
                                            
                                            weatherData.image = result.weather[0].description
                                            
                                            weatherData.Convertion()
                                            callback(true, weatherData)
                                        }else {
                                        callback(false, nil)
                                        }
                                    }
                
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
    
    func GetWeatherByLocation(callback: @escaping (Bool, WeatherData?) -> Void) {
    
        let URLString = findLocation()
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let result = try JSONDecoder().decode(WeatherAPI.self, from: data)
                            let name =  result.name
                            let temp = result.main.temp
                            let tempMin = result.main.temp_min
                            let tempMax = result.main.temp_max
                            let country =  result.sys.country
                            let weather =  result.weather
                            self.icon = result.weather[0].icon
                           
                 
                                    self.getIcon { (data) in
                                        if let data = data {
                                            var weatherData = WeatherData(name: name, temp: temp, tempMin: tempMin, tempMax: tempMax, country: country, weather: weather, icon: data)
                                            
                                          weatherData.image = result.weather[0].description
                                            
                                            weatherData.Convertion()
                                            callback(true, weatherData)
                                        }else {
                                        callback(false, nil)
                                        }
                                    }
        
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
    

    
    func getIcon(completionHandler: @escaping (Data?) -> Void){
        let baseString = "http://openweathermap.org/img/wn/"
        let iconUrl = icon
        let taille = "@2x.png"
        let URLString = baseString + iconUrl! + taille
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data, error == nil {
                        do {
                            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                             
                                completionHandler(data)
                                
                            }
                       
                        if let error = error {
                            print(error.localizedDescription)
                           completionHandler(nil)
                        }
                        
                    }
                }
            }
            }.resume()
    }
}

}
