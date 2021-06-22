//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import UIKit

class WeatherViewController: UIViewController {
   
    var cityName1 = ""
    var cityName2 = ""
    
    var weather1 = WeatherService(name: "tokyo")
    var weather2 = WeatherService(name: "paris")
    
    
    @IBOutlet weak var nameCity1: UITextField!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    
    
    @IBOutlet weak var valider: UIButton!
    
    @IBOutlet weak var nameCity2: UITextField!
    @IBOutlet weak var city2: UILabel!
    @IBOutlet weak var temperature2: UILabel!
    @IBOutlet weak var tempMax2: UILabel!
    @IBOutlet weak var tempMin2: UILabel!
    
    
    
    @IBAction func tappedButton(_ sender: Any) {
        cityName1 = nameCity1.text!
        cityName2 = nameCity2.text!
        
        weather1 = WeatherService(name: cityName1)
        weather2 = WeatherService(name: cityName2)
        
        CompareWeather(weather1: weather1, weather2: weather2)
        
        
    }
    
    func CompareWeather(weather1 : WeatherService, weather2 : WeatherService){
        
        weatherShow(weather: weather1)
        weatherShow2(weather: weather2)
    }
    
    func weatherShow(weather : WeatherService){
        weather.GetWeather{ (success, weatherData) in
            if success, let weatherData = weatherData {
                self.update(weatherData: weatherData)
            }else {
                
            }
        }
    }
    
    func weatherShow2(weather : WeatherService){
        weather.GetWeather{ (success, weatherData) in
            if success, let weatherData = weatherData {
                self.update2(weatherData: weatherData)
            }else {
                
            }
        }
    }
    
    func update(weatherData : WeatherData){
       
        self.city.text = weatherData.name
       
        self.temperature.text = "\(weatherData.temperature)"
        self.tempMin.text = "\(weatherData.temperatureMin)"
        self.tempMax.text = "\(weatherData.temperatureMax)"
    }
    
    
    func update2(weatherData : WeatherData){
        
        self.city2.text = weatherData.name
        self.temperature2.text = "\(weatherData.temperature)"
        self.tempMin2.text = "\(weatherData.temperatureMin)"
        self.tempMax2.text = "\(weatherData.temperatureMax)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
}
