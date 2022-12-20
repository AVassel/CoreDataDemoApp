//
//  UIAlertController + Ext.swift
//  CoreDataDemoApp
//
//  Created by Anton Vassel on 17.12.2022.
//

import UIKit

extension UIAlertController {
    
    func action(task: Task?, completion: @escaping (String) -> Void) {
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "New Task"
            textField.text = task?.title
        }
    }
}
