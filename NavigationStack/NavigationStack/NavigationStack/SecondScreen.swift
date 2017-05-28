//
//  SecondScreen.swift
//  NavigationStack
//
//  Created by C0mrade on 5/28/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit

class SecondScreen: UIViewController {
    
    // IBOutlet List
    @IBOutlet weak var imageView: UIImageView!

    // Required variable
    var image = UIImage()
    
    // View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    // Actions
    @IBAction func showGeorgianCupTapped(_ sender: UIButton) {
        let image = UIImage(named: "3")
        let vc = storyboard?.instantiateViewController(withIdentifier: "xxxThirdScreen") as? ThirdScreen
        vc?.image = image!
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
