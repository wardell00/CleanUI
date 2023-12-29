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
    
    /// Init for primary Button
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
    /// Init for secondary Button
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
    /// Init for tertiary Button
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

    
    public var body: some View {
        Button {
            action()
        } label: {
            switch buttonHierarchy {
            case .primaryButton:
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
            case .secondaryButton:
                if fullWidth {
                    buttonLabel()
                        .foregroundStyle(isDisabled ? Color(uiColor: UIColor.systemGray3) : labelColor)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            secondaryBackground()
                        }
                }
                else {
                    buttonLabel()
                        .foregroundStyle(isDisabled ? Color(uiColor: UIColor.systemGray3) : labelColor)
                        .padding()
                        .background {
                            secondaryBackground()
                        }
                }
            case .tertiaryButton:
                buttonLabel()
                    .foregroundStyle(isDisabled ? Color(uiColor: UIColor.systemGray3) : labelColor)
            }
        }
        .disabled(isDisabled)
        
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
                .fill(isDisabled ? Color(uiColor: UIColor.systemGray3) : backgroundColor)
        }
        else {
            RoundedRectangle(cornerRadius: 10)
                .fill(isDisabled ? Color(uiColor: UIColor.systemGray3) : backgroundColor)
        }
    }
    
    @ViewBuilder
    private func secondaryBackground() -> some View {
        if iconOnly {
            Circle()
                .fill(.clear)
                .stroke(isDisabled ? Color(uiColor: UIColor.systemGray3) : labelColor, lineWidth: 2.5)
        }
        else {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .stroke(isDisabled ? Color(uiColor: UIColor.systemGray3) : labelColor, lineWidth: 2.5)
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
        }
        .padding()
    }
}
