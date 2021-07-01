//
//  DeviseViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import UIKit

class DeviseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
  
    
    var devise = DeviseService(deviseName: "AED", devise: 2.2)
    var deviseSelect = "AED"
    var deviseValue = 4.384179
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return deviseName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let symbols = deviseName[row].symbols
        let countryName = deviseName[row].countryName
        let country = symbols + " " + countryName
        return country
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
          
            deviseSelect = deviseName[row].symbols
        
        }

    @IBOutlet weak var base: UITextField!
    @IBOutlet weak var deviseBase: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var result: UILabel!
    
    
    
    @IBAction func ConvertButton(_ sender: Any) {
        deviseValue =  Double(base.text!)!
        devise = DeviseService(deviseName: deviseSelect, devise: deviseValue)
        
        Convert(deviseService: devise)
     
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func Convert(deviseService : DeviseService){
        devise.getAPI { (success, deviseData) in
            if success, let deviseData = deviseData {
                self.update(deviseData: deviseData)
               
            }else {
                
            }
        }
    }
    
    func update(deviseData : DeviseData){
        result.text = String(deviseData.resultat!)

    }
  

}
