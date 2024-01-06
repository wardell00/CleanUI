//
//  CleanButton.swift
//
//
//  Created by Alexander Löwe on 27.12.23.
//

import SwiftUI

public struct CleanButton: View {
    
    let action : () -> Void
    let label : LocalizedStringKey
    let labelColor : Color
    let backgroundColor: Color
    let strokeColor : Color
    let icon : String?
    let iconOnly: Bool
    let buttonHierarchy : CleanButtonHierarchy
    let fullWidth: Bool
    let isDisabled : Bool
    
    /// Init for primary button
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                labelColor : Color,
                backgroundColor: Color,
                icon: String? = nil,
                iconOnly: Bool = false,
                fullWidth : Bool = false,
                isDisabled: Bool) {
        self.action = action
        self.label = label
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.strokeColor = .clear
        self.icon = icon
        self.iconOnly = iconOnly
        self.buttonHierarchy = .primaryButton
        self.fullWidth = fullWidth
        self.isDisabled = isDisabled
    }
    /// Init for secondary button
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                strokeColor : Color,
                icon: String? = nil,
                iconOnly: Bool = false,
                fullWidth : Bool = false,
                isDisabled: Bool) {
        self.action = action
        self.label = label
        self.labelColor = strokeColor
        self.backgroundColor = .clear
        self.strokeColor = strokeColor
        self.icon = icon
        self.iconOnly = iconOnly
        self.buttonHierarchy = .secondaryButton
        self.fullWidth = fullWidth
        self.isDisabled = isDisabled
    }
    /// Init for tertiary button
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                labelColor: Color,
                icon: String? = nil,
                iconOnly: Bool = false,
                isDisabled: Bool) {
        self.action = action
        self.label = label
        self.labelColor = labelColor
        self.backgroundColor = .clear
        self.strokeColor = .clear
        self.icon = icon
        self.iconOnly = iconOnly
        self.buttonHierarchy = .tertiaryButton
        self.fullWidth = false
        self.isDisabled = isDisabled
    }
    
    /// Init for fully customzable button
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                labelColor: Color,
                backgroundColor: Color,
                strokeColor: Color,
                icon: String?,
                iconOnly: Bool,
                fullWidth: Bool,
                isDisabled: Bool) {
        self.action = action
        self.label = label
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.strokeColor = strokeColor
        self.icon = icon
        self.iconOnly = iconOnly
        self.buttonHierarchy = .fullyCustomizable
        self.fullWidth = fullWidth
        self.isDisabled = isDisabled
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            switch buttonHierarchy {
            case .primaryButton:
                primaryButton()
            case .secondaryButton:
               secondaryButton()
            case .tertiaryButton:
                tertiaryButton()
            case .fullyCustomizable:
               fullyCustomizableButton()
            }
        }
        .disabled(isDisabled)
        
    }
    
    var mainColor : Color {
        return isDisabled ? Color(uiColor: UIColor.systemGray3) : (buttonHierarchy == .primaryButton ? backgroundColor : labelColor)
    }
    @ViewBuilder
    private func buttonLabel() -> some View {
        if let icon {
            if iconOnly {
                Label(label, systemImage: icon)
                    .labelStyle(.iconOnly)
            }
            else {
                Label(label, systemImage: icon)
            }
        }
        else {
            Text(label)
        }
    }
    
    @ViewBuilder
    private func primaryBackground() -> some View {
        if iconOnly {
            Circle()
                .fill(mainColor)
        }
        else {
            RoundedRectangle(cornerRadius: 10)
                .fill(mainColor)
        }
    }
    
    @ViewBuilder
    private func secondaryBackground() -> some View {
        if iconOnly {
            Circle()
                .fill(.clear)
                .stroke(mainColor, lineWidth: 2.5)
        }
        else {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .stroke(mainColor, lineWidth: 2.5)
        }
    }
    
    @ViewBuilder
    private func primaryButton() -> some View {
        if fullWidth {
            buttonLabel()
                .foregroundStyle(labelColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    primaryBackground()
                }
        }
        else {
            buttonLabel()
                .foregroundStyle(labelColor)
                .padding()
                .background {
                    primaryBackground()
                }
        }
    }
    
    @ViewBuilder
    private func secondaryButton() -> some View {
        if fullWidth {
            buttonLabel()
                .foregroundStyle(mainColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    secondaryBackground()
                }
        }
        else {
            buttonLabel()
                .foregroundStyle(mainColor)
                .padding()
                .background {
                    secondaryBackground()
                }
        }
    }
    
    @ViewBuilder
    private func tertiaryButton() -> some View {
        buttonLabel()
            .foregroundStyle(mainColor)
    }
    
    @ViewBuilder
    private func fullyCustomizableButton() -> some View {
        if fullWidth {
            buttonLabel()
                .foregroundStyle(labelColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isDisabled ? Color(uiColor: UIColor.systemGray3)  : backgroundColor)
                        .stroke(isDisabled ? Color(uiColor: UIColor.systemGray3)  : strokeColor, lineWidth: 2.0)
                }
        }
        else {
            buttonLabel()
                .foregroundStyle(labelColor)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isDisabled ? Color(uiColor: UIColor.systemGray3)  : backgroundColor)
                        .stroke(isDisabled ? Color(uiColor: UIColor.systemGray3)  : strokeColor, lineWidth: 2.0)
                }
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 50) {
            VStack(alignment: .leading) {
                Text("Primary Button")
                CleanButton(action: {},
                            label: "Delete",
                            labelColor: .white,
                            backgroundColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: true,
                            isDisabled: false)
                CleanButton(action: {},
                            label: "Delete",
                            labelColor: .white,
                            backgroundColor: .red,
                            fullWidth: true,
                            isDisabled: false)
                HStack {
                    Spacer()
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .white,
                                backgroundColor: .red,
                                icon: "trash",
                                iconOnly: false,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .white,
                                backgroundColor: .red,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .white,
                                backgroundColor: .red,
                                icon: "trash",
                                iconOnly: true,
                                isDisabled: false)
                    Spacer()
                }
                CleanButton(action: {},
                            label: "Delete",
                            labelColor: .white,
                            backgroundColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: true,
                            isDisabled: true)
            }
            
            VStack(alignment: .leading) {
                Text("Secondary Button")
                CleanButton(action: {},
                            label: "Delete",
                            strokeColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: true,
                            isDisabled: false)
                CleanButton(action: {},
                            label: "Delete",
                            strokeColor: .red,
                            fullWidth: true,
                            isDisabled: false)
                HStack {
                    Spacer()
                    CleanButton(action: {},
                                label: "Delete",
                                strokeColor: .red,
                                icon: "trash",
                                iconOnly: false,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                strokeColor: .red,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                strokeColor: .red,
                                icon: "trash",
                                iconOnly: true,
                                isDisabled: false)
                    Spacer()
                }
                CleanButton(action: {},
                            label: "Delete",
                            strokeColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: true,
                            isDisabled: true)
            }
            
            
            VStack(alignment: .leading) {
                Text("Tertiary Button")
                HStack(spacing: 20) {
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .red,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .red,
                                icon: "trash",
                                iconOnly: false,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .red,
                                icon: "trash",
                                iconOnly: true,
                                isDisabled: false)
                    CleanButton(action: {},
                                label: "Delete",
                                labelColor: .red,
                                icon: "trash",
                                iconOnly: false,
                                isDisabled: true)
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                Text("Fully Customizable Button")
                CleanButton(action: {},
                            label: "Delete",
                            labelColor: .blue,
                            backgroundColor: .purple,
                            strokeColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: true,
                            isDisabled: false)
                CleanButton(action: {},
                            label: "Delete",
                            labelColor: .blue,
                            backgroundColor: .purple,
                            strokeColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: false,
                            isDisabled: false)
                CleanButton(action: {},
                            label: "Delete",
                            labelColor: .blue,
                            backgroundColor: .purple,
                            strokeColor: .red,
                            icon: "trash",
                            iconOnly: false,
                            fullWidth: false,
                            isDisabled: true)
            }
        }
        .padding()
    }
}
