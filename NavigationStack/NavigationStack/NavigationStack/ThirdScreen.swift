//
//  ThirdScreen.swift
//  NavigationStack
//
//  Created by C0mrade on 5/28/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit

class ThirdScreen: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backToFirstScreenTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
