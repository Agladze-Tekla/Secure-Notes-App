//
//  LoginViewController.swift
//  Secure Note App
//
//  Created by Tekla on 11/5/23.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    private let loginStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.backgroundColor = UIColor(displayP3Red: 25/255, green: 0/255, blue: 60/255, alpha: 0.6)
        stack.layer.cornerRadius = 25
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 65, left: 100, bottom: 65, right: 100)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username:"
        label.textColor = .systemIndigo
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.textColor = .systemIndigo
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addSubviews()
        setupConstraints()
    }

    //MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor), loginStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    private func addSubviews() {
        view.addSubview(loginStackView)
        loginStackView.addArrangedSubview(usernameLabel)
        loginStackView.addArrangedSubview(usernameTextField)
        loginStackView.addArrangedSubview(passwordLabel)
        loginStackView.addArrangedSubview(passwordTextField)
    }
}

