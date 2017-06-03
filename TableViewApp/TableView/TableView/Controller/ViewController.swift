//
//  ViewController.swift
//  TableView
//
//  Created by C0mrade on 5/29/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var dataObject = [User]()
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInformation()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Information Fetch
    func fetchInformation () {
        
        for i in 1..<10 {
            let object = User()
            object.avatar = UIImage(named: "avatar_\(i)")
            object.picture = UIImage(named: "picture_\(i)")
            
            object.name = "MilaJovovicOfficial_\(i)"
            object.views = "\(i) views"
            object.upload = "\(i) days ago"
            
            dataObject.append(object)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "xxxTableViewCell", for: indexPath) as? TableViewCell else {
            fatalError("Could not dequeue cell with identifier xxxTableViewCell")
        }
        
        let object = dataObject[indexPath.row]
        
        // Data Assign
        
        cell.avatar.image = object.avatar
        cell.picture.image = object.picture
        cell.name.text = object.name
        cell.uploadDate.text = object.upload
        cell.views.text = object.views
        
        // Make Circle Avatar
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width/2.0
        cell.avatar.layer.masksToBounds = true
        
        // Make Border Outline
        cell.avatar.layer.borderColor = UIColor.lightGray.cgColor
        cell.avatar.layer.borderWidth = 1.0
        
        return cell
    }
}

