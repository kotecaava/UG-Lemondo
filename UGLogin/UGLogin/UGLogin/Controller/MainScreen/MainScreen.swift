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

class MainScreen: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var btnLogin: FBSDKLoginButton!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.readPermissions = ["public_profile", "email", "user_friends", "user_photos"]
        getUserInformation()
    }
    
    // MARK: - Determine User Status
    private func userIsLoggedIn () -> Bool {
        return FBSDKAccessToken.current() != nil
    }
    
    fileprivate func getUserInformation () {
        if userIsLoggedIn() {
            let params = ["fields":"id,name,picture.type(large),email"]
            FBSDKGraphRequest(graphPath: "me", parameters: params).start(completionHandler: { (connection, result, error) -> Void in
                if error == nil && result != nil {
                    self.generateUserObjectUsingGraphResponse(with: result!)
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
        }
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
            print("User Logged In Successfully")
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out!")
    }
}
