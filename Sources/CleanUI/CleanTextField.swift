//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Löwe on 22.12.23.
//

import SwiftUI

/** The different types of TextFields
 */
public enum CleanTextFieldStyle: CaseIterable {
    case standard
    case line
    case outline
}

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
                StandardTextField()
            case .line:
                LineTextField()
            case .outline:
                TextField(placeholder, text: $text, axis: .vertical)
            }
        }
    }
}

#Preview {
    VStack(alignment: .center, spacing: 30) {
        ForEach(CleanTextFieldStyle.allCases, id: \.self) { style in
            CleanTextField(text: .constant(""),
                           placeholder: "Email",
                           style: style)
                
        }
    }
    .padding()
    
}

private struct CleanTextFieldMod : ViewModifier {
    
    let keyboardType : UIKeyboardType
    @FocusState var isFocused : Bool
    
    func body(content: Content) -> some View {
        content
            .keyboardType(keyboardType)
            .focused($isFocused)
            .onTapGesture {
                withAnimation {
                    isFocused.toggle()
                }
            }
    }
}

private extension View {
    func textFieldMod(keyboardType : UIKeyboardType, isFocused: FocusState<Bool>) -> some View {
        modifier(CleanTextFieldMod(keyboardType: keyboardType, isFocused: isFocused))
    }
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
}

