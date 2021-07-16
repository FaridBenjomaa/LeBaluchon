//
//  TranslationViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 09/07/2021.
//

import UIKit

class TranslationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

 
    var targetLanguage = ""
    var sourcelanguage = ""
    var translation = TranslationService(quoteText: "Bonjour", language: "en")
    var translationData : TranslationData?
    
    @IBOutlet weak var translateResult: UILabel!
    @IBOutlet weak var imageBubble: UIImageView!
    @IBOutlet weak var targetlanguagePickerView: UIPickerView!
    @IBOutlet weak var textToTranslate: UITextField!
    @IBAction func translateButton(_ sender: Any) {
        imageBubble.isHidden = false
        let quote = textToTranslate.text!
        translation = TranslationService(quoteText: quote, language: targetLanguage)
        translate(deviseService: translation)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let name = languageName[row].name

        return name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
          

            targetLanguage = languageName[row].symbols
       
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    func translate(deviseService : TranslationService){
        translation.translateApi { (success, translationData) in
            if success, let translationData = translationData {
                self.update(translationData: translationData)
                
            }else {
                self.presentAlert()
            }
        }
    }

    
    func update(translationData : TranslationData){
        translateResult.text = translationData.translatedText
    }
    
    func presentAlert(){
        let alertVC = UIAlertController(title: "Error", message: "La traduction n'est pas possible", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
   
    
}
