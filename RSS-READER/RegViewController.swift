//
//  RegViewController.swift
//  RSS-READER
//
//  Created by Hacker Man on 19.11.2020.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseFirestore


class RegViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var regButton: UIButton!
    
    @IBAction func c(_ sender: UIButton) {
        let email = emailField.text ?? ""
        let password = passField.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            
            
            let db = Firestore.firestore()
            
            db.collection("users").addDocument(data: ["uid": result!.user.uid ]) { (error) in
                if error == nil {
                    print("yes")
                    print(result!.user.uid)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
