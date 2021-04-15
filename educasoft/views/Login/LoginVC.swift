//
//  LoginVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 24/01/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bntLogin: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bntLogin.layer.cornerRadius = 10
    }
    
// AUTENTICACAO COM FIREBASE
    @IBAction func bntLoginAC(_ sender: UIButton) {
        if let email = self.userTextField.text, let password = self.passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) {
                authResult, error in
                
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "LoginToApp", sender: self)
                }
            }
        }
    }

}
