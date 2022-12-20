//
//  UIButton + Extention.swift
//  CoreDataDemoApp
//
//  Created by Anton Vassel on 06.12.2022.
//

import UIKit

enum action: String {
    case save = "Save"
    case cancel = "Cancel"
}

extension UIButton {
    convenience init(title: String,
                     action: action
    ) {
        self.init(type: .system)
        
        self.setTitle(action.rawValue, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 4
        switch action {
        case .save:
            self.backgroundColor = UIColor(red: 21/255, green: 101/255, blue: 192/255, alpha: 1)
        case .cancel:
            self.backgroundColor = UIColor(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
}
