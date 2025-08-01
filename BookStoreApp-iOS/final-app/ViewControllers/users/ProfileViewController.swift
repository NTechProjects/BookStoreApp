//
//  LoginViewController.swift
//  final-app
//
//  Created by sunbeam on 21/07/25.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add logout button on right top corner
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
    }
    
    @objc func logout(){
        //clear all the cached items
        //UserDefaults = UserDefaults.standard
        let userDefaults = UserDefaults.standard
        
        userDefaults.removeObject(forKey: "name")
        userDefaults.removeObject(forKey: "token")
        userDefaults.removeObject(forKey: "mobile")
        
        //commit the changes done in user defaults
        userDefaults.synchronize()
        
        //get the scene delegate object
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        //start the login workflow
        sceneDelegate.startLoginWOrkflow()
    }

}
