//
//  TranslationAPI.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 09/07/2021.
//

import Foundation


struct TransaltionAPI: Decodable {
    let data: DataClass
}


struct DataClass: Decodable {
    let translations: [Translation]
}


struct Translation: Decodable {
    let translatedText : String
    let detectedSourceLanguage: String
}




