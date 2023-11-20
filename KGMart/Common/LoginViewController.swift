//
//  ViewController.swift
//  KGMart
//
//  Created by Gulzat on 13/11/23.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    
    private let bgImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_login_bg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginLabel: UILabel = {
       let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let mailLabel: UILabel = {
       let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let mailTF: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter an email"
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 16, weight: .regular)
        return tf
    }()
    
    private let dividerMail = UIView()
    
    private let passwordLabel: UILabel = {
       let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let passwordTF: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter a password"
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 16, weight: .regular)
        let image = UIImage(systemName: "eye.slash.fill") //eye.fill
        tf.rightViewMode = .always
        tf.rightView = UIImageView(image: image)
        tf.rightView?.tintColor = .black
        tf.isSecureTextEntry = true
        tf.rightView?.isUserInteractionEnabled = true
        return tf
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let dividerPassword = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .white
        
        configureBGImage()
        configureLoginLabel()
        configureMailLabel()
        configureMailTF()
        configureMailDivider()
        configurePasswordLabel()
        configurePasswordTF()
        configurePasswordDivider()
        configureLoginButton()
    }
   
    private func configureBGImage() {
        view.addSubview(bgImage)
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImage.heightAnchor.constraint(equalToConstant: height/2)
        ])
    }
    
    private func configureLoginLabel() {
        bgImage.addSubview(loginLabel)
        NSLayoutConstraint.activate([
            loginLabel.bottomAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: -20),
            loginLabel.leadingAnchor.constraint(equalTo: bgImage.leadingAnchor, constant: 20),
            loginLabel.trailingAnchor.constraint(equalTo: bgImage.trailingAnchor, constant: -20),
        ])
    }
    
    private func configureMailLabel() {
        view.addSubview(mailLabel)
        NSLayoutConstraint.activate([
            mailLabel.topAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: 12),
            mailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func configureMailTF() {
        view.addSubview(mailTF)
        NSLayoutConstraint.activate([
            mailTF.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 4),
            mailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func configureMailDivider() {
        dividerMail.backgroundColor = .black
        dividerMail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dividerMail)
        NSLayoutConstraint.activate([
            dividerMail.topAnchor.constraint(equalTo: mailTF.bottomAnchor, constant: 10),
            dividerMail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividerMail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dividerMail.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func configurePasswordLabel() {
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: dividerMail.bottomAnchor, constant: 32),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func configurePasswordTF() {
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 4),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rightViewTapped))
        passwordTF.rightView?.addGestureRecognizer(tapGesture)
    }
    
    @objc func rightViewTapped(_ gesture: UITapGestureRecognizer) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    private func configurePasswordDivider() {
        dividerPassword.backgroundColor = .black
        dividerPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dividerPassword)
        NSLayoutConstraint.activate([
            dividerPassword.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 10),
            dividerPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dividerPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dividerPassword.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func configureLoginButton() {
       
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        loginButton.addTarget(self, action: #selector(loginValidate), for: .touchUpInside)
    }
    
    @objc func loginValidate(_ sender: UIButton) {
        if mailTF.text == "KGMart@gmail.com" && passwordTF.text == "KGMart01" {
            navigationController?.pushViewController(CatalogViewController(), animated: true)
        } else {
            mailTF.text = ""
            passwordTF.text = ""
            mailTF.placeholder = "Введите правильные данные"
            passwordTF.placeholder = "Введите правильные данные"
        }
    }
}

