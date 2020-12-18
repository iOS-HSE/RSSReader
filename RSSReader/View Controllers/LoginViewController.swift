//
//  LoginViewController.swift
//  RSSReader
//
//  Created by Олеся Мартынюк on 20.11.2020.
//  Copyright © 2020 Olesia Martinyuk. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    func checkValidFields() -> String? {
           if emailTextField.text == "" || emailTextField.text == nil ||
               passwordTextField.text == "" || passwordTextField.text == nil {
               return "Необходимо заполнить все поля"
           }
           return nil
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let result = checkValidFields()
           if result != nil {
               errorLabel.alpha = 1
               errorLabel.numberOfLines = 0
               errorLabel.textColor = .red
               errorLabel.lineBreakMode = .byWordWrapping
               errorLabel.text = result
               errorLabel.sizeToFit()
           }
           else {
            self.errorLabel.alpha = 0
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
                   (result, error) in
                   if error != nil {
                        self.errorLabel.alpha = 1
                        self.errorLabel.numberOfLines = 0
                        self.errorLabel.textColor = .red
                        self.errorLabel.lineBreakMode = .byWordWrapping
                        self.errorLabel.text = error?.localizedDescription
                        self.errorLabel.sizeToFit()
                   }
                   else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "tabc") as! TabController
//                    secondVC.modalPresentationStyle = .overCurrentContext
//                    let newNavVC = UINavigationController(rootViewController: secondVC)
                    self.view.window?.rootViewController = secondVC
                    
//                    self.navigationController?.isNavigationBarHidden = true
//                    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
//                    self.navigationController?.pushViewController(secondVC, animated: true)
                }
               }
           }
    }

    
    
}
