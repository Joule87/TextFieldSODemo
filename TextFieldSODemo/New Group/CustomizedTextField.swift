//
//  CustomizedTextField.swift
//  TextFieldSODemo
//
//  Created by Julio Collado Perez on 11/18/23.
//

import Foundation
import SwiftUI

struct CustomizedTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    let placeholder: String?
    let textAlignment: NSTextAlignment
    let onDeleteBackward: NilBooleanAction
    
    init(text: Binding<String>,
         placeholder: String? = nil,
         textAlignment: NSTextAlignment = NSTextAlignment.natural,
         onDeleteBackward: NilBooleanAction = nil) {
        self._text = text
        self.placeholder = placeholder
        self.textAlignment = textAlignment
        self.onDeleteBackward = onDeleteBackward
    }
    
    func makeCoordinator() -> CustomizedTextFieldCoordinator {
        CustomizedTextFieldCoordinator(textBinding: $text)
    }
    
    func makeUIView(context: Context) -> CustomizedUITextField {
        let view = CustomizedUITextField()
        view.placeholder = placeholder
        view.text = text
        view.textAlignment = textAlignment
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: CustomizedUITextField, context: Context) {
        uiView.text = text
        uiView.onDeleteBackward = onDeleteBackward
    }
}
