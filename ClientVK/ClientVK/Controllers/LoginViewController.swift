//
//  ViewController.swift
//  ClientVK
//
//  Created by Kiryusha Orlov on 24.06.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginCompleteButton(_ sender: UIButton) {
        
        //some operation with token and other Singleton's things
        let session = Session.shared
        session.name = "Кирилл"
        session.id = 1
        session.token = "someToken"
        
    }
    
    // MARK: - Hide Keyboard
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return self.view.endEditing(true)
        }
        
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
}

