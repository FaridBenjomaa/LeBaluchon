//
//  TranslationService.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 09/07/2021.
//

import Foundation

class TranslationService {
    
    var quoteText : String?
    var language : String?
    
    init(quoteText : String, language : String){
        self.quoteText = quoteText
        self.language = language
    }
    
    private var task : URLSessionTask?
    private var translateSession = URLSession(configuration: .default)
    
    init (translateSession : URLSession, quoteText: String, language: String) {
        self.translateSession = translateSession
        self.quoteText = quoteText
        self.language = language
    }
    
    func getUrl(quoteText: String, language: String) -> String {

        let baseString = "https://translation.googleapis.com/language/translate/v2?"
        let accessKey = "key=AIzaSyA7sOACPVemSPuWDTztJZc8fUX_hR67X6I"
        let quote = "&q=\(quoteText)"
        let quoteText = quote.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let targetLanguage = "&target=\(language)"
        let model = "&model=nmt"
        let URLString = baseString + accessKey  + targetLanguage + model + quoteText!
        
        return URLString
    
    }
    
    
    func translateApi(callback: @escaping (Bool, TranslationData?) -> Void) {
        
        let URLString = getUrl(quoteText: quoteText!, language: language!)
        
        if let url = URL(string: URLString) {
            task =  translateSession.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
            
                    if let data = data {
                    do {
                        let result = try JSONDecoder().decode(TransaltionAPI.self, from: data)
            
                        let sourceLanguage = result.data.translations[0].detectedSourceLanguage
                        let translatedText = result.data.translations[0].translatedText
                        
                        print(self.quoteText!)
                        print(translatedText)
                        print(sourceLanguage)
                        let translationData = TranslationData(translatedText: translatedText, sourceLanguage: sourceLanguage)
                     
                        callback(true, translationData)
                        
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
            }
           task?.resume()
        }
        
    }
}
