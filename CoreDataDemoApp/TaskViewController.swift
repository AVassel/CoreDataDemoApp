//
//  TaskViewController.swift
//  CoreDataDemoApp
//
//  Created by Anton Vassel on 06.12.2022.
//

import UIKit

class TaskViewController : UIViewController {
    private lazy var newTaskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(title: "Save Task", action: .save)
        button.addTarget(
            self,
            action: #selector(save),
            for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(title: "Cancel", action: .cancel)
        button.addTarget(
            self,
            action: #selector(cancel),
            for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews(newTaskTextField, saveButton, cancelButton)
        setConstraints()
    }
    
    private func setConstraints() {
        setConstraintsToTextField()
        setConstraintsToSaveButton()
        setConstraintsToCancelButton()
    }
    
    private func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraintsToTextField() {
        NSLayoutConstraint.activate([
            newTaskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            newTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            newTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func setConstraintsToSaveButton() {
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: newTaskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func setConstraintsToCancelButton() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func save() {
        dismiss(animated: true)
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
}
