//
//  ContentView.swift
//  TextFieldSODemo
//
//  Created by Julio Collado Perez on 11/18/23.
//

import SwiftUI

//https://stackoverflow.com/questions/76684922/detect-backspace-event-on-textfield-using-subclass-or-delegate-solution-integrat

struct ContentView: View {
    @State private var char01: String = ""
    @State private var char02: String = ""
    @State private var char03: String = ""
    @State private var char04: String = ""
    @FocusState private var nextResponder: TextFieldIdentifier?
    
    enum TextFieldIdentifier: Int {
        case first
        case second
        case third
        case fourth
    }
    
    private var code: String {
        return char01 + char02 + char03 + char04
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            VStack {
                HStack(alignment: .center ,spacing: 8) {
                    Group {
                        CustomizedTextField(text: $char01, textAlignment: .center , onDeleteBackward: {
                            nextResponder = .none
                        })
                        .focused($nextResponder, equals: .first)
                        
                        CustomizedTextField(text: $char02, textAlignment: .center, onDeleteBackward: {
                            nextResponder = .first
                        })
                        .focused($nextResponder, equals: .second)
                        
                        CustomizedTextField(text: $char03, textAlignment: .center, onDeleteBackward: {
                            nextResponder = .second
                        })
                        .focused($nextResponder, equals: .third)
                        
                        CustomizedTextField(text: $char04, textAlignment: .center, onDeleteBackward: {
                            nextResponder = .third
                        })
                        .focused($nextResponder, equals: .fourth)
                    }
                    .frame(width: 44, height: 57)
                    .font(.system(size: 42))
                    .background(.white)
                    .cornerRadius(10)
                }
                .onChange(of: char01, { oldValue, newValue in
                    switchFieldIfNeeded(oldValue: oldValue, newValue: newValue)
                })
                .onChange(of: char02, { oldValue, newValue in
                    switchFieldIfNeeded(oldValue: oldValue, newValue: newValue)
                })
                .onChange(of: char03, { oldValue, newValue in
                    switchFieldIfNeeded(oldValue: oldValue, newValue: newValue)
                })
                .onChange(of: char04, { oldValue, newValue in
                    switchFieldIfNeeded(oldValue: oldValue, newValue: newValue)
                })
                
                Text("Code: \(code)")
                    .padding()
            }
        }
    }
    
    private func switchFieldIfNeeded(oldValue: String, newValue: String) {
        if newValue.isEmpty {
            return
        }
        switch nextResponder {
        case .first:
            nextResponder = .second
        case .second:
            nextResponder = .third
        case .third:
            nextResponder = .fourth
        case .fourth:
            nextResponder = .none
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}
