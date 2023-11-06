//
//  LoginViewController.swift
//  Secure Note App
//
//  Created by Tekla on 11/5/23.
//

import UIKit

final class LoginViewController: UIViewController {

    //MARK: - Properties
    private let loginStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.backgroundColor = UIColor(displayP3Red: 25/255, green: 0/255, blue: 60/255, alpha: 0.6)
        stack.layer.cornerRadius = 25
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 45, left: 85, bottom: 65, right: 85)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username:"
        label.textAlignment = .center
        label.textColor = .systemIndigo
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.textAlignment = .center
        label.textColor = .systemIndigo
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 85, height: textField.frame.height))
        textField.rightViewMode = .always

        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = AutoAddPaddingButtton()
        button.backgroundColor = UIColor(displayP3Red: 25/255, green: 0/255, blue: 60/255, alpha: 0.6)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    class AutoAddPaddingButtton : UIButton {
        override var intrinsicContentSize: CGSize {
           get {
               let baseSize = super.intrinsicContentSize
               return CGSize(width: baseSize.width + 50,
                             height: baseSize.height + 10)
               }
        }
    }
    
    class KeychainHelper {
        enum KeyChainError: Error {
               case sameItemFound
               case unknown
               case nosuchDataFound
               case KCErrorWithCode(Int)
           }
        
        func save(
                service: String,
                account: String,
                password: Data
            ) {
                let query: [String: AnyObject] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: service as AnyObject,
                    kSecAttrAccount as String: account as AnyObject,
                    kSecValueData as String: password as AnyObject,
                ]
                
                let status = SecItemAdd(query as CFDictionary, nil)
            }
        
        func get(
                service: String,
                account: String
            ) -> Data? {
                let query: [String: AnyObject] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrService as String: service as AnyObject,
                    kSecAttrAccount as String: account as AnyObject,
                    kSecReturnData as String: kCFBooleanTrue as AnyObject,
                    kSecMatchLimit as String: kSecMatchLimitOne
                ]
                var result: AnyObject?
                let status = SecItemCopyMatching(query as CFDictionary, &result)
                return result as? Data
            }
    }
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Private Methods
    private func setupView() {
        setupBackground()
        addSubviews()
        setupConstraints()
        setupLoginButton()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor), loginStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        NSLayoutConstraint.activate([loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), loginButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 60)])
    }
    
    private func addSubviews() {
        view.addSubview(loginStackView)
        view.addSubview(loginButton)
        loginStackView.addArrangedSubview(usernameLabel)
        loginStackView.addArrangedSubview(usernameTextField)
        loginStackView.addArrangedSubview(passwordLabel)
        loginStackView.addArrangedSubview(passwordTextField)
    }
    
    private func setupLoginButton() {
        loginButton.addAction(UIAction(handler: { [weak self] action in
            self?.pushNoteListViewController()
        }), for: .touchUpInside)
    }
    
    private func pushNoteListViewController() {
        if usernameTextField.text!.isEmpty  || passwordTextField.text!.isEmpty {
            print("Please write the username and password")
        } else {
          //  KeychainHelper.save(service: "Secure Notes", account: usernameTextField.text!, password: passwordTextField.text)
        
        let noteListViewController = NoteListViewController()
        navigationController?.pushViewController(noteListViewController, animated: true)
        }
    }
    
}

