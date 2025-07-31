//
//  LoginViewController.swift
//  final-app
//
//  Created by sunbeam on 21/07/25.
//

import UIKit

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
            
        }
    }
    
}
