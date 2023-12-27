import SwiftUI

struct CleanSecureField : View {
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
    
    var body: some View {
        switch style {
        case .standard:
            StandardInputField(text: $text,
                               isFocused: _isFocused,
                               placeholder: placeholder,
                               keyboard: keyboard,
                               color: color) {
                SecureFieldImp(text: $text,
                               placeholder: (isFocused || !text.isEmpty) ? "" : placeholder,
                               color: color)
            }
        case .line:
            LineInputField(text: $text,
                               isFocused: _isFocused,
                               placeholder: placeholder,
                               keyboard: keyboard,
                               color: color) {
                SecureFieldImp(text: $text,
                               placeholder: (isFocused || !text.isEmpty) ? "" : placeholder,
                               color: color)
            }
        case .outline:
            OutlineInputField(text: $text,
                               isFocused: _isFocused,
                               placeholder: placeholder,
                               keyboard: keyboard,
                               color: color) {
                SecureFieldImp(text: $text,
                               placeholder: (isFocused || !text.isEmpty) ? "" : placeholder,
                               color: color)
            }
        case .symbol(let sfSymbol):
            SfSymbolInputField(text: $text,
                               isFocused: _isFocused,
                               placeholder: placeholder,
                               keyboard: keyboard,
                               color: color,
                               symbol: sfSymbol) {
                SecureFieldImp(text: $text,
                               placeholder: (isFocused || !text.isEmpty) ? "" : placeholder,
                               color: color)
            }
        }
    }
}

#Preview {
    
    VStack(spacing: 40) {
        CleanSecureField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .standard)
        CleanSecureField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .line)
        CleanSecureField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .outline)
        CleanSecureField(text: .constant(""),
                       placeholder: "Email",
                       color: .mint,
                       style: .symbol(sfSymbol: "envelope.fill"))
    }
    .padding()
    .preferredColorScheme(.light)
    
}
