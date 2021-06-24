//
//  WeatherViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController,  CLLocationManagerDelegate{
   
    
      
    var latLong : String?
      
    let manager = CLLocationManager()
    
    var homview = HomeViewController()
    
    var cityName1 = ""
    var cityName2 = ""
    
    var weather1 = WeatherService(name:  "latLong")
    var weather2 = WeatherService(name:  "lat=&lon")
    
    
  
    @IBOutlet weak var imageCity: UIStackView!
    @IBOutlet weak var nameCity1: UITextField!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var valider: UIButton!
    
    @IBOutlet weak var imageCity2: UIStackView!
    @IBOutlet weak var nameCity2: UITextField!
    @IBOutlet weak var city2: UILabel!
    @IBOutlet weak var temperature2: UILabel!
    @IBOutlet weak var tempMax2: UILabel!
    @IBOutlet weak var tempMin2: UILabel!
    @IBOutlet weak var icon2: UIImageView!
    
    
    
    @IBAction func tappedButton(_ sender: Any) {
        cityName1 = nameCity1.text!
        cityName2 = nameCity2.text!
        
        weather1 = WeatherService(name:  cityName1)
        weather2 = WeatherService(name: cityName2)
        
        CompareWeather(weather1: weather1, weather2: weather2)
        
        
    }
    
    func CompareWeather(weather1 : WeatherService, weather2 : WeatherService){
        
        weatherShow(weather: weather1)
        weatherShow2(weather: weather2)
        valider.isHidden = true
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
       
        nameCity1.isHidden = true
        temperature.isHidden = false
        tempMax.isHidden = false
        tempMin.isHidden = false
        city.isHidden = false
        icon.isHidden = false
        
        
        self.city.text = weatherData.name
        self.temperature.text = "Temperature :\(weatherData.temperature)"
        self.tempMin.text = "Temperature Minimum :\(weatherData.temperatureMin)"
        self.tempMax.text = "Temperature Maximum : \(weatherData.temperatureMax)"
        self.icon.image = UIImage(data : weatherData.icon)
        
        let background = UIImage(data : weatherData.backgroundImage)
        
        self.imageCity.backgroundColor = UIColor(patternImage:  background!)
    }
    
    
    func update2(weatherData : WeatherData){
        
        nameCity2.isHidden = true
        temperature2.isHidden = false
        tempMax2.isHidden = false
        tempMin2.isHidden = false
        city2.isHidden = false
        icon2.isHidden = false
        
        self.city2.text = weatherData.name
        self.temperature2.text = "Temperature \(weatherData.temperature)"
        self.tempMin2.text = "Temperature Minimum \(weatherData.temperatureMin)"
        self.tempMax2.text = "Temperature Maximum \(weatherData.temperatureMax)"
        self.icon2.image = UIImage(data : weatherData.icon)
        
        let background = UIImage(data : weatherData.backgroundImage)
        
        self.imageCity2.backgroundColor = UIColor(patternImage:  background!)
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
        
        latLong = "lat=\(latitude)&lon\(longitude)"
        
    }
 
}
