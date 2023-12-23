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
                LineTextField()
            case .outline:
                TextField(isFocused ? "" : placeholder, text: $text, axis: .vertical)
                    .textFieldMod(keyboardType: keyboard, isFocused: _isFocused)
                    .padding()
                    .background {
                        if isFocused || !text.isEmpty {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                    .fill(.clear)
                                    .stroke(color, lineWidth: 2.0)
                                Text(placeholder)
                                    .padding(.horizontal)
                                    .background(Color.white)
                                    .offset(x: 20.0, y: -11.0)
                                    .foregroundStyle(color)
                            }
                        }
                        else {
                            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                                .fill(.clear)
                                .stroke(.secondary, lineWidth: 2.0)
                        }
                    }
            case .symbol(sfSymbol: let sfSymbol):
                SfSymbolTextField(sfSymbol)
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
    .preferredColorScheme(.light)
    
}



private extension CleanTextField {
    
    @ViewBuilder
    private func StandardTextField() -> some View {
        VStack(alignment: .leading) {
            Text(placeholder)
                .padding(.leading, 10)
            TextField(placeholder, text: $text, axis: .vertical)
                .textFieldMod(keyboardType: keyboard, isFocused: _isFocused)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isFocused ? color.opacity(0.08) : .clear)
                        .stroke(isFocused ? color : .secondary,
                                lineWidth: 2.0)
                }
            
        }
    }
    
    @ViewBuilder
    private func LineTextField() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            if isFocused || !text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(color)
                    .padding([.leading, .top], 10)
            }
            TextField(placeholder, text: $text, axis: .vertical)
                .textFieldMod(keyboardType: keyboard, isFocused: _isFocused)
                .padding([.leading, .bottom], 10)
                .padding(.top, (isFocused || !text.isEmpty) ? 4: 30)
            
        }
        .background {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.tertiary)
                Divider()
                    .frame(height: (isFocused || !text.isEmpty) ? 5 : 2)
                    .overlay(color)
                    .offset(y: -0.4)
            }
        }
    }
    
    @ViewBuilder
    private func SfSymbolTextField(_ symbol : String) -> some View {
        VStack(alignment: .leading) {
            Text(placeholder)
                .padding(.leading, 10)
            HStack {
                Image(systemName: symbol)
                    .foregroundStyle(color)
                TextField(placeholder, text: $text, axis: .vertical)
                    .textFieldMod(keyboardType: keyboard, isFocused: _isFocused)
                
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isFocused ? color.opacity(0.08) : .clear)
                    .stroke(isFocused ? color : .secondary,
                            lineWidth: 2.0)
            }
        }
    }
}

