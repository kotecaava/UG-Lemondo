//
//  FirstScreen.swift
//  NavigationStack
//
//  Created by C0mrade on 5/28/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit

class FirstScreen: UIViewController {

    @IBAction func goToSecondScreen(_ sender: UIButton) {
        let image = UIImage(named: "2")
        let vc = storyboard?.instantiateViewController(withIdentifier: "xxxSecondScreen") as? SecondScreen
        vc?.image = image!
        navigationController?.pushViewController(vc!, animated: true)
    }

}
