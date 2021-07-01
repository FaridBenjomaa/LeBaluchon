//
//  DeviseService.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import Foundation

class DeviseService {
    
    var deviseName : String?
    var devise : Double
    
    init(deviseName : String, devise : Double){
        self.deviseName = deviseName
        self.devise = devise
    }

    func getAPI(callback: @escaping (Bool, DeviseData?) -> Void){
        let baseString = "http://data.fixer.io/api/latest?"
        let accessKey = "access_key=d264f2e52a15ca678edf49b7cc8e86ae"
        let URLString = baseString + accessKey
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(Devise.self, from: data)
            
                        
                        let rates : [String:Double] = result.rates
                        let deviseSelect = rates[self.deviseName!]

                        var deviseData = DeviseData(devise : self.devise, deviseSelect: deviseSelect, rates: rates)
                        deviseData.resultat = deviseData.Convertion()
                    
                     
                        callback(true, deviseData)
                        
                    } catch {
                        print(error.localizedDescription)
                        callback(false, nil)
                    }
                    if let error = error {
                        print("Error: \(error.localizedDescription)" )
                        callback(false, nil)
                    }
                }
            }
            }.resume()
        }else {
            print("Cette url n'existe pas")
        }
        
    }
    
    
}
