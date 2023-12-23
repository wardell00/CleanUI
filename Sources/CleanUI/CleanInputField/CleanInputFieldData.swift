import Foundation
import SwiftUI

@frozen
public enum CleanTextFieldStyle {
    case standard
    case line
    case outline
    case symbol(sfSymbol: String)
}

struct SecureFieldImp : View {
    @State private var isSecure: Bool = true
    @Binding var text: String
    let placeholder : LocalizedStringKey
    let color : Color
    var body: some View {
        
        HStack {
            if isSecure {
                SecureField(placeholder, text: $text)
            }
            else {
                TextField(placeholder, text: $text)
            }
            
            Button {
                withAnimation {
                    isSecure.toggle()
                }
            } label: {
                Label("Toggle Input Visibility", systemImage: isSecure ? "eye.slash.fill" : "eye.fill")
                    .foregroundStyle(color)
                    .labelStyle(.iconOnly)
            }
        }
    }
}
struct CleanTextFieldMod : ViewModifier {
    
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

extension View {
    func textFieldMod(keyboardType : UIKeyboardType, isFocused: FocusState<Bool>) -> some View {
        modifier(CleanTextFieldMod(keyboardType: keyboardType, isFocused: isFocused))
    }
}

struct StandardInputField<Content: View> : View {
    
    @Binding var text : String
    @FocusState var isFocused : Bool
    let placeholder: LocalizedStringKey
    let keyboard : UIKeyboardType
    let color : Color
    
    @ViewBuilder let input: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if (isFocused || !text.isEmpty) {
                Text(placeholder)
                    .padding(.leading, 10)
            }
            input()
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
}

