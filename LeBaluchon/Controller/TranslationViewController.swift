//
//  TranslationViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 09/07/2021.
//

import UIKit

class TranslationViewController: UIViewController {

    var translation = TranslationService(quoteText: "Bonjour", language: "en")
    var translationData : TranslationData?
    
    @IBOutlet weak var textToTranslate: UITextField!
    @IBAction func translateButton(_ sender: Any) {
        let quote = textToTranslate.text!
        translation = TranslationService(quoteText: quote, language: "en")
        translate(deviseService: translation)
    }
    

    @IBOutlet weak var translateResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    func translate(deviseService : TranslationService){
        translation.translateApi { (success, translationData) in
            if success, let translationData = translationData {
                self.update(translationData: translationData)
               
            }else {
                
            }
        }
    }

    
    func update(translationData : TranslationData){
        translateResult.text = translationData.translatedText

    }
    
    
}
