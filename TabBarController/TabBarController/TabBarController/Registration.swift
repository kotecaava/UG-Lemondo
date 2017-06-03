//
//  Registration.swift
//  TabBarController
//
//  Created by C0mrade on 6/3/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit

class Registration: UIViewController {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    // Create simple completion block
    func downloadInfo (completionBlock: (Bool) -> () ) {
        completionBlock(true)
    }
    
}

extension Registration: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty {
            print("Jigaro")
        } else {
            print("Figaro")
        }
        
        return true
    }
}
