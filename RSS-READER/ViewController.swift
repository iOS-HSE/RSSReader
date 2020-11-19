//
//  ViewController.swift
//  RSS-READER
//
//  Created by Hacker Man on 19.11.2020.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Авторизация"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    
    private let loginTextField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "Ваш e-mail"
        loginField.layer.borderWidth = 1
        loginField.layer.borderColor = UIColor.black.cgColor
        return loginField
    }()
    
    
    private let passTextField: UITextField = {
        let passField = UITextField()
        passField.placeholder = "Ваш пароль"
        passField.layer.borderWidth = 1
        passField.layer.borderColor = UIColor.black.cgColor
        return passField
    }()
    
    
    private let loginButton: UIButton = {
        let logButton = UIButton()
        logButton.backgroundColor = .systemBlue
        logButton.setTitleColor(.white, for: .normal)
        logButton.setTitle("Войти", for: .normal)
        return logButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(loginTextField)
        view.addSubview(passTextField)
        view.addSubview(loginButton)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0, y: 30, width: view.frame.size.width, height: 30)
        loginTextField.frame = CGRect(x: 10, y: 220, width: view.frame.size.width - 20, height: 30)
        passTextField.frame = CGRect(x: 10, y: 250, width: view.frame.size.width - 20, height: 30)
        loginButton.frame = CGRect(x: 10, y: 500, width: view.frame.size.width - 20, height: 30)
    }


}

