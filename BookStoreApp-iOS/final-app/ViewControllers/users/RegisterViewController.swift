//
//  LoginViewController.swift
//  final-app
//
//  Created by sunbeam on 21/07/25.
//

import UIKit
import Alamofire

class RegisterViewController: BaseViewController {

    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editEmail: UITextField!
    @IBOutlet weak var editAddress: UITextField!
    @IBOutlet weak var editMobile: UITextField!
    @IBOutlet weak var editPassword: UITextField!
    @IBOutlet weak var editConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onRegister(_ sender: Any) {
        if editName.text!.count == 0 {
            showErrorAlert(message: "Please enter name")
        }else if editEmail.text!.count == 0 {
            showErrorAlert(message: "Please enter email")
        }else if editAddress.text!.count == 0 {
            showErrorAlert(message: "Please enter address")
        }else if editMobile.text!.count == 0 {
            showErrorAlert(message: "Please enter mobile")
        }else if editPassword.text!.count == 0 {
            showErrorAlert(message: "Please enter password")
        }else if editConfirmPassword.text!.count == 0 {
            showErrorAlert(message: "Please confirm password")
        }else if editPassword.text! != editConfirmPassword.text!{
            showErrorAlert(message: "Pssword does not match")
        }else{
            //create url
            let url = createUrl(path: "/users/signup")
            
            //create body
            let body = [
                "name": editName.text!,
                "password": editPassword.text!,
                "email": editEmail.text!,
                "mobile": editMobile.text!,
                "addr": editAddress.text!
            ]
            
            //create the request
            let request = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default)
            
            //send the request and get the response
            request.response(completionHandler: { response in
                switch response.result{
                case .success(let data):
                    //type cast the data to dictionary of String and Any
                    let result = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                    
                    //check if registration is successful
                    if result["status"] as! String == "success" {
                        self.showSuccessAlert(message: "Successfully registered a user")
                        self.navigationController?.popViewController(animated: true)
                    } else{
                        self.showErrorAlert(message: "Failed to register a user")
                    }
                case.failure(let error):
                    self.showErrorAlert(message: "Failed to register a user")
                }
            })
        }
    }
    
}
