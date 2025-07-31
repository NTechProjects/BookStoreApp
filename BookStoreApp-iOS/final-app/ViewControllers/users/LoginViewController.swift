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
        editEmail.textContentType = .username
        editPassword.textContentType = .oneTimeCode
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if editEmail.text!.count == 0 {
            showErrorAlert(message: "Please enter email")
        }
        else if editPassword.text!.count == 0 {
            showErrorAlert(message: "Please enter password")
        }else{
            //create URL
//            let url = createUrl(path: "users/signin")
            
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
                    print(data)
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
}
