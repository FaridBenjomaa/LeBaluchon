//
//  Devise.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

struct Devise : Decodable {
    var success : Bool
    var base : String
    var rates : [String:Double]
   

}

