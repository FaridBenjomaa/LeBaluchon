//
//  Weather.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

struct WeatherAPI: Decodable {
    var coord : Coord
    var weather : [Weather]
    var base : String
    var main : Main
    var visibility : Double
    var wind : Wind
    var clouds : Clouds
    var dt : Double
    var sys : Sys
    var timezone : Double
    var id: Double
    var name: String
    var cod: Int
    
}

struct Coord: Decodable {
    var lon : Double
    var lat : Double
}

struct Weather: Decodable {
    var id : Int
    var main : String
    var description : String
    var icon : String
}
struct Main: Decodable {
    var temp: Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Double
    var humidity : Double
}
struct Wind: Decodable {
    var speed : Double
    var deg : Double
}
struct Clouds: Decodable {
    var all: Int
    
}
struct Sys: Decodable {
    var type: Int
    var id : Double
    var country : String
    var sunrise : Double
    var sunset : Double
    
}
