//
//  DeviseService.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

class DeviseService {
    

    
    func getAPI(_ devise: String){
        let baseString = "http://data.fixer.io/api/latest?"
        let accessKey = "access_key=d264f2e52a15ca678edf49b7cc8e86ae"
        let devise = "Symbols=\(devise.uppercased())"
        let URLString = baseString + accessKey + "&" + devise
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(Devise.self, from: data)
                        print(result.rates)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                
                if let error = error {
                    print("Error: \(error.localizedDescription)" )
                }
            }.resume()
        }else {
            print("Cette url n'existe pas")
        }
        
    }
    
}
