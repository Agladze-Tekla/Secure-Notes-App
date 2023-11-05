//
//  AddNoteViewController.swift
//  Secure Note App
//
//  Created by Tekla on 11/5/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    //MARK: - Properties
    
    private let noteStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 25
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 40, left: 20, bottom: 40, right: 20)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private let noteNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Note Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let noteTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        setupBackground()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func addSubviews() {
        view.addSubview(noteStackView)
        noteStackView.addArrangedSubview(noteNameTextField)
        noteStackView.addArrangedSubview(noteTextView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            noteStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            noteStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            noteStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            noteStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
    }

    private func setupNavigationBar() {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(setupSaveButtonAction)
        )
        navigationItem.setRightBarButton(barButtonItem, animated: true)
        
    }
    
    @objc private func setupSaveButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
