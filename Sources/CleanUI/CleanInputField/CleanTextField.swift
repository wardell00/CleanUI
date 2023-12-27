//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Löwe on 22.12.23.
//

import SwiftUI


public struct CleanTextField: View {
    
    @Binding var text : String
    @FocusState private var isFocused : Bool
    
    let placeholder : LocalizedStringKey
    let color : Color
    let style : CleanTextFieldStyle
    let keyboard : UIKeyboardType
    
    init(text: Binding<String>,
         placeholder: LocalizedStringKey,
         color: Color = .accentColor,
         style: CleanTextFieldStyle = .standard,
         keyboard: UIKeyboardType = .default) {
        
        self._text = text
        self.placeholder = placeholder
        self.color = color
        self.style = style
        self.keyboard = keyboard
    }
    
    public var body: some View {
        ZStack {
            switch style {
            case .standard:
                StandardInputField(text: $text,
                                   isFocused: _isFocused,
                                   placeholder: placeholder,
                                   keyboard: keyboard,
                                   color: color) {
                    TextField((isFocused || !text.isEmpty) ? "" : placeholder, text: $text)
                }
            case .line:
                LineInputField(text: $text,
                               isFocused: _isFocused,
                               placeholder: placeholder,
                               keyboard: keyboard,
                               color: color) {
                    TextField(placeholder, text: $text, axis: .vertical)
                }
            case .outline:
                OutlineInputField(text: $text,
                                  isFocused: _isFocused,
                                  placeholder: placeholder,
                                  keyboard: keyboard,
                                  color: color) {
                    TextField(isFocused ? "" : placeholder, text: $text, axis: .vertical)
                }
            case .symbol(sfSymbol: let sfSymbol):
                SfSymbolInputField(text: $text,
                                   isFocused: _isFocused,
                                   placeholder: placeholder,
                                   keyboard: keyboard,
                                   color: color,
                                   symbol: sfSymbol) {
                    TextField(isFocused ? "" : placeholder, text: $text, axis: .vertical)
                }
            }
        }
    }
}

#Preview {
    
    VStack(spacing: 40) {
        CleanTextField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .standard)
        CleanTextField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .line)
        CleanTextField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .outline)
        CleanTextField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .symbol(sfSymbol: "envelope.fill"))
    }
    .padding()
    .preferredColorScheme(.dark)
    
}


