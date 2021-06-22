//
//  DeviseViewController.swift
//  LeBaluchon
//
//  Created by Farid Benjomaa on 14/05/2021.
//

import UIKit

class DeviseViewController: UIViewController {
var devise = DeviseService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        devise.getAPI("USD")
        
    }
    

}
