//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController,  CLLocationManagerDelegate{
   
    
      
    var lat : Double?
    var lon : Double?
      
    let manager = CLLocationManager()
    
    var homview = HomeViewController()
    
    var cityName1 = ""
    var cityName2 = ""
    
    var weather1 = WeatherService(name:  "latLong")
    var weather2 = WeatherService(name:  "lat=&lon")
    
    
  


    @IBOutlet weak var imageCity: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var valider: UIButton!
    

    @IBOutlet weak var imageCity2: UIImageView!
    @IBOutlet weak var nameCity2: UITextField!
    @IBOutlet weak var city2: UILabel!
    @IBOutlet weak var temperature2: UILabel!
    @IBOutlet weak var tempMax2: UILabel!
    @IBOutlet weak var tempMin2: UILabel!
    @IBOutlet weak var icon2: UIImageView!
    
    
    
    @IBAction func tappedButton(_ sender: Any) {
        cityName2 = nameCity2.text!
        
        weather1 = WeatherService(name: cityName1)
        weather2 = WeatherService(name: cityName2)
        
        CompareWeather(weather1: weather1, weather2: weather2)
    
    }
    
    func CompareWeather(weather1 : WeatherService, weather2 : WeatherService){
        
        weatherShow(weather: weather1)
        weatherShow2(weather: weather2)
        valider.isHidden = true
    }
    
    func weatherShow(weather : WeatherService){
        weather.getWeatherByCity { (success, weatherData) in
            if success, let weatherData = weatherData {
                self.update(weatherData: weatherData)
                
            }else {
                
            }
        }
    }
    
    func weatherShow2(weather : WeatherService){
        weather.getWeatherByCity{ (success, weatherData) in
            if success, let weatherData = weatherData {
                self.update2(weatherData: weatherData)
                
            }else {
                
            }
        }
    }
    
    func weatherShowDefault(weather : WeatherService){
        weather.getWeatherByLocation { (success, weatherData) in
            if success, let weatherData = weatherData {
                self.update(weatherData: weatherData)
                
            }else {
                
            }
        }
    }
    
    func update(weatherData : WeatherData){
       
      
        temperature.isHidden = false
        tempMax.isHidden = false
        tempMin.isHidden = false
        city.isHidden = false
        icon.isHidden = false
       
        
        self.imageCity.image =  UIImage(named: weatherData.image!)
        self.city.text = weatherData.name
        self.temperature.text = "Temperature :\(weatherData.temperature)"
        self.tempMin.text = "Temperature Minimum :\(weatherData.temperatureMin)"
        self.tempMax.text = "Temperature Maximum : \(weatherData.temperatureMax)"
        self.icon.image = UIImage(data : weatherData.icon)
      
    }
    
    
    func update2(weatherData : WeatherData){
        
        nameCity2.isHidden = true
        temperature2.isHidden = false
        tempMax2.isHidden = false
        tempMin2.isHidden = false
        city2.isHidden = false
        icon2.isHidden = false
       
        
        self.imageCity2.image = UIImage(named: weatherData.image!)
        self.city2.text = weatherData.name
        self.temperature2.text = "Temperature \(weatherData.temperature)"
        self.tempMin2.text = "Temperature Minimum \(weatherData.temperatureMin)"
        self.tempMax2.text = "Temperature Maximum \(weatherData.temperatureMax)"
        self.icon2.image = UIImage(data : weatherData.icon)
        
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
  
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        weather1 = WeatherService(lat: latitude, lon: longitude)
        
        weatherShowDefault(weather: weather1)
    }
 
}
