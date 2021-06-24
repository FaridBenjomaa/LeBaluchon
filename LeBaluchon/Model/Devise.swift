//
//  Devise.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

struct Devise : Decodable {
    var success : Bool
    //var timestamp : Int
    //var base : String
    //var date : Date
    var rates : Rates

}

struct Rates: Decodable {
    var USD : Double
}
