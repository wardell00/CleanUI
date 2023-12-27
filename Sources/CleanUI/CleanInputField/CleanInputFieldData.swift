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
private struct CleanTextFieldMod : ViewModifier {
    
    let keyboardType : UIKeyboardType
    @FocusState var isFocused : Bool
    
    func body(content: Content) -> some View {
        content
            .keyboardType(keyboardType)
            .focused($isFocused)
            .onTapGesture {
                isFocused.toggle()
            }
    }
}

private extension View {
    func textFieldMod(keyboardType : UIKeyboardType, isFocused: FocusState<Bool>) -> some View {
        modifier(CleanTextFieldMod(keyboardType: keyboardType, isFocused: isFocused))
    }
}

struct StandardInputField<Content: View> : View {
    
    @Environment(\.colorScheme) private var colorScheme
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
                        .fill(colorScheme == .dark ? Color(uiColor: UIColor.systemGray6) : .white)
                        .stroke(isFocused ? color : Color(uiColor: UIColor.systemGray6),
                                lineWidth: 2.0)
                }
            
        }
    }
}

struct LineInputField<Content: View> : View {
    
    @Binding var text : String
    @FocusState var isFocused : Bool
    let placeholder: LocalizedStringKey
    let keyboard : UIKeyboardType
    let color : Color
    
    @ViewBuilder let input: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if isFocused || !text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(color)
                    .padding([.leading, .top], 10)
            }
            input()
                .textFieldMod(keyboardType: keyboard, isFocused: _isFocused)
                .padding([.leading, .bottom], 10)
                .padding(.top, (isFocused || !text.isEmpty) ? 4: 30)
                .padding(.trailing, 10)
            
        }
        .background {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(uiColor: UIColor.systemGray6))
                Divider()
                    .frame(height: (isFocused || !text.isEmpty) ? 5 : 2)
                    .overlay(color)
                    .offset(y: -0.4)
            }
        }
    }
}

struct OutlineInputField<Content: View> : View {

    @Binding var text : String
    @FocusState var isFocused : Bool
    let placeholder: LocalizedStringKey
    let keyboard : UIKeyboardType
    let color : Color
    
    @ViewBuilder let input: () -> Content
    
    var body: some View {
        input()
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
                            .background(Color(uiColor: UIColor.systemBackground))
                            .offset(x: 20.0, y: -11.0)
                            .foregroundStyle(color)
                    }
                }
                else {
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        .fill(.clear)
                        .stroke(Color(uiColor: UIColor.systemGray6), lineWidth: 2.0)
                }
            }
    }
}

struct SfSymbolInputField<Content: View> : View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var text : String
    @FocusState var isFocused : Bool
    let placeholder: LocalizedStringKey
    let keyboard : UIKeyboardType
    let color : Color
    let symbol : String
    
    @ViewBuilder let input: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            if isFocused || !text.isEmpty  {
                Text(placeholder)
                    .padding(.leading, 10)
            }
            HStack {
                Image(systemName: symbol)
                    .foregroundStyle(color)
                input()
                    .textFieldMod(keyboardType: keyboard, isFocused: _isFocused)
                
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(colorScheme == .dark ? Color(uiColor: UIColor.systemGray6) : .white)
                    .stroke(isFocused ? color : Color(uiColor: UIColor.systemGray6),
                            lineWidth: 2.0)
            }
        }
    }
}
