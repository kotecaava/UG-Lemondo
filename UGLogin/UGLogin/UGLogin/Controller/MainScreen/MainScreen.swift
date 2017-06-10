//
//  MainScreen.swift
//  UGLogin
//
//  Created by C0mrade on 6/9/17.
//  Copyright © 2017 Levan Mamulashvili. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SDWebImage

class MainScreen: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet fileprivate weak var avatar: UIImageView!
    @IBOutlet fileprivate weak var lblName: UILabel!
    @IBOutlet fileprivate weak var lblId: UILabel!
    @IBOutlet fileprivate weak var btnLogin: FBSDKLoginButton!
    @IBOutlet fileprivate weak var holder: UIView!
    @IBOutlet weak var lblEmail: UILabel!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.readPermissions = ["public_profile", "email", "user_friends", "user_photos"]
        configUI()
        getUserInformation()
    }
    
    // MARK: - Create Avatar As Circle
    fileprivate func configUI () {
        // fix scale
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        
        // set circle
        avatar.layer.cornerRadius = avatar.frame.size.width/2
        avatar.layer.masksToBounds = true
        
        // set borders
        avatar.layer.borderColor = UIColor.blue.cgColor
        avatar.layer.borderWidth = 0.8
    }
    
    // MARK: - Determine User Status
    private func userIsLoggedIn () -> Bool {
        return FBSDKAccessToken.current() != nil
    }
    
    // MARK: - Download Informatio
    fileprivate func getUserInformation () {
        if userIsLoggedIn() {
            let params = ["fields":"id,name,picture.type(large),email"]
            
            FBSDKGraphRequest(graphPath: "me", parameters: params).start(completionHandler: { [weak self] (connection, result, error) -> Void in
                if error == nil && result != nil {
                    self?.generateUserObjectUsingGraphResponse(with: result!)
                }
            })
        } else {
            print("Not Logged In!")
        }
    }
    
    // MARK: - Construct User Object
    private func generateUserObjectUsingGraphResponse (with result: Any) {
        var object = User()
        if let rep = result as? [String: Any] {
            object.email = rep["email"] as? String
            object.id = rep["id"] as! String
            object.name = rep["name"] as! String
            object.avatar = self.getUserAvatarUrl(with: rep["picture"] as! [String: Any])
            
            self.userInterfaceConfiguration(with: object)
        }
    }
    
    // MARK: - Assign Information
    fileprivate func userInterfaceConfiguration (with object: User) {
        holder.isHidden = false
        lblId.text = object.id
        lblName.text = object.name
        lblEmail.text = object.email
        avatar.sd_setImage(with: object.avatar)
    }
    
    // MARK: - Parse Profile Picture
    private func getUserAvatarUrl (with value: [String: Any]) -> URL? {
        if let value1 = value["data"] as? [String: Any] {
            if let value2 = value1["url"] as? String {
                return URL(string: value2)
            }
        }
        return nil
    }
}

// MARK: - FBSDKLoginButtonDelegate
extension MainScreen: FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error == nil {
            getUserInformation()
            print("User Logged In Successfully")
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        holder.isHidden = true
        print("User Logged Out!")
    }
}
