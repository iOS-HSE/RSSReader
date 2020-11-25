//
//  SignInViewController.swift
//  RSSReader
//
//  Created by Олеся Мартынюк on 20.11.2020.
//  Copyright © 2020 Olesia Martinyuk. All rights reserved.
//

import UIKit

import FirebaseAuth
import Firebase

class SignInViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    func checkValidFields() -> String? {
        if nameTextField.text == "" || nameTextField.text == nil ||
            emailTextField.text == "" || emailTextField.text == nil ||
            passwordTextField.text == "" || passwordTextField.text == nil {
            return "Необходимо заполнить все поля"
        }
        return nil
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        let result = checkValidFields()
        if result != nil {
            errorLabel.alpha = 1
            errorLabel.textColor = .red
            errorLabel.text = result
        }
        else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
                (result, error) in
                if error != nil {
                    self.errorLabel.text = "\(String(describing: error?.localizedDescription))"
                }
                else {
                    self.errorLabel.alpha = 0
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "name": self.nameTextField.text!,
                        "email": self.emailTextField.text!,
                        "password": self.passwordTextField.text!,
                        "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            self.errorLabel.alpha = 1
                            self.errorLabel.textColor = .red
                            self.errorLabel.text = "Saving user error"
                        }
                        else {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let secondVC = storyboard.instantiateViewController(identifier: "PageViewController") as! PageViewController
                            self.navigationController?.pushViewController(secondVC, animated: true)
                        }
                    }
                }
            }
        }
    }
    
    

}
