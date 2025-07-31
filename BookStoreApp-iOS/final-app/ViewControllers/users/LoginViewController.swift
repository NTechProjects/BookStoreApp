//
//  LoginViewController.swift
//  final-app
//
//  Created by sunbeam on 21/07/25.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {

    
    @IBOutlet weak var editPassword: UITextField!
    @IBOutlet weak var editEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if editEmail.text!.count == 0 {
            showErrorAlert(message: "Please enter email")
        }
        else if editPassword.text!.count == 0 {
            showErrorAlert(message: "Please enter password")
        }else{
            //create URL
            let url = createUrl(path: "/users/signin")
            
            //create the body
            let body = [
                "email": editEmail.text!,
                "password": editPassword.text!
            ]
            
            //create request
            let request = AF.request(url, method:.post, parameters: body, encoding: JSONEncoding.default)
            
            //send the request and get the response
            request.response(completionHandler: {response in
                switch response.result{
                case .success(let data):
                    //parse the data using JSON parser and convert it into dictionary (JSON object)
                    let result = try! JSONSerialization.jsonObject(with: data!) as! [String: Any]
                    
                    //check if the result is success
                    if result["status"] as! String == "success" {
                        
                        //get the data from result
                        let data = result["data"] as! [String: Any]
                        
                        //cache the user details(name, email, token)
                        //userDefaults=> SharedPreferences(in Android)
                        let userDefaults = UserDefaults.standard
                        userDefaults.set("name", forKey: data["name"] as! String)
                        userDefaults.set("token", forKey: data["token"] as! String)
                        userDefaults.set("mobile", forKey: data["mobile"] as! String)
                        
                        //commit the changes done in user default
                        userDefaults.synchronize()
                        
                        self.showSuccessAlert(message: "welcome to the application")
                    } else{
                        self.showErrorAlert(message: "Invalid email or password")
                    }
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
}
