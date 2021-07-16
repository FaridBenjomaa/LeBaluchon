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
    
    @IBOutlet weak var base: UITextField!
    @IBOutlet weak var deviseBase: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var result: UILabel!
    

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

    
    
    
    
    @IBAction func ConvertButton(_ sender: Any) {
        
        if Double(base.text!) != nil{
            deviseValue =  Double(base.text!)!
        }else{
            presentAlert()
        }
       
        
        devise = DeviseService(deviseName: deviseSelect, devise: deviseValue)
        Convert(deviseService: devise)
     
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    func Convert(deviseService : DeviseService){
        devise.getDevise { (success, deviseData) in
            if success, let deviseData = deviseData {
                self.update(deviseData: deviseData)
               
            }else {
                self.presentAlert()
            }
        }
    }
    
    func update(deviseData : DeviseData){
        result.text = String(deviseData.resultat!)

    }
    
    func presentAlert(){
        let alertVC = UIAlertController(title: "Error", message: "Merci d'utilisé des chifres", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
  

}
