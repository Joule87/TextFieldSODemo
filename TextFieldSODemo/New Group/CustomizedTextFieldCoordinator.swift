//
//  CustomizedTextFieldCoordinator.swift
//  TextFieldSODemo
//
//  Created by Julio Collado Perez on 11/18/23.
//

import SwiftUI

class CustomizedTextFieldCoordinator: NSObject {
    let text: Binding<String>
    
    init(textBinding: Binding<String>) {
        self.text = textBinding
    }
}

extension CustomizedTextFieldCoordinator: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != "\n" {
            text.wrappedValue = string
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
