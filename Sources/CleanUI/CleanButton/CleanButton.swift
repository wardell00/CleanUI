//
//  CleanButton.swift
//
//
//  Created by Alexander Löwe on 27.12.23.
//

import SwiftUI

public struct CleanButton: View {
    
    let action : () -> Void
    let placeholder : LocalizedStringKey
    let placeholderColor : Color?
    let buttonHierarchy : CleanButtonHierarchy
    let isDisabled : Bool
    
    public var body: some View {
        Button {
            action()
        } label: {
            switch buttonHierarchy {
            case .cleanButtonPrimary:
                Text(placeholder)
                    .foregroundStyle(placeholderColor ?? .primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                    }
            case .cleanButtonSecondary:
                Text(placeholder)
                    .foregroundStyle(isDisabled ? Color(uiColor: UIColor.systemGray3) : placeholderColor ?? .accentColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.clear)
                            .stroke(isDisabled ? Color(uiColor: UIColor.systemGray3) : placeholderColor ?? .accentColor, lineWidth: 2.5)
                            
                    }
            case .cleanButtontertiary:
                Text(placeholder)
                    .foregroundStyle(isDisabled ? Color(uiColor: UIColor.systemGray3) : placeholderColor ?? .accentColor)
            }
        }
        .disabled(isDisabled)
    }
}

#Preview {
    VStack(spacing: 20) {
        CleanButton(action: {}, placeholder: "Log in", placeholderColor: .white, buttonHierarchy: .cleanButtonPrimary, isDisabled: false)
        CleanButton(action: {}, placeholder: "Log in", placeholderColor: nil, buttonHierarchy: .cleanButtonSecondary, isDisabled: false)
        CleanButton(action: {}, placeholder: "Log in", placeholderColor: nil, buttonHierarchy: .cleanButtontertiary, isDisabled: false)
    }
    .padding()
    .preferredColorScheme(.light)
}
