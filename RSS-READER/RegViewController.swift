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
    
    @IBAction func clickedButton(_ sender: Any) {
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
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
