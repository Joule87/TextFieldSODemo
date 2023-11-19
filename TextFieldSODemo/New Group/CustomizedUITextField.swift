//
//  CustomizedUITextField.swift
//  TextFieldSODemo
//
//  Created by Julio Collado Perez on 11/18/23.
//

import UIKit

typealias NilBooleanAction = (() -> Void)?

class CustomizedUITextField: UITextField {
    var onDeleteBackward: NilBooleanAction
    
    override init(frame: CGRect) {
        onDeleteBackward = nil
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func deleteBackward() {
        onDeleteBackward?()
        super.deleteBackward()
    }
}
