//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by C0mrade on 6/5/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func panGestureActivated(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view) // get current dragged points
        if let view = sender.view { // check if sender view which means imageView exsits
            view.center = CGPoint(x: view.center.x + translation.x, // current position + new position X
                y: view.center.y + translation.y) // current position + new position Y
        }
        sender.setTranslation(CGPoint.zero, in: self.view) // draw current changes
    }
    
    @IBAction func pinchGestureActivated(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view { // check if view inside sender exsits a.k.a imageView
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale) // current sender scale
            sender.scale = 1
        }
    }
    
    @IBAction func rotationGestureActivated(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view { // check if view inside sender exsits a.k.a imageView
            view.transform = view.transform.rotated(by: sender.rotation) // set rotation got from sender
            sender.rotation = 0
        }
    }
    
}

