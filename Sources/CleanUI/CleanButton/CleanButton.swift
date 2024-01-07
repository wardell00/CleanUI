//
//  CleanButton.swift
//
//
//  Created by Alexander Löwe on 27.12.23.
//

import SwiftUI

public struct CleanButton: View {
    
    let action : () -> Void
    let labeltext : LocalizedStringKey
    let labelColor : Color
    let backgroundColor: Color
    let strokeColor : Color
    let icon : String?
    let buttonStyle : CleanButtonStyle
    let fullWidth: Bool
    let isDisabled : Bool
    let iconOnlyStyle : IconOnlyButtonStyle
    /// Generates a solid button
    /// mainly used for primary actions
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                labelColor : Color,
                backgroundColor: Color,
                icon: String? = nil,
                fullWidth : Bool = false,
                isDisabled: Bool) {
        self.action = action
        self.labeltext = label
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.strokeColor = .clear
        self.icon = icon
        self.buttonStyle = .solidButton
        self.fullWidth = fullWidth
        self.isDisabled = isDisabled
        self.iconOnlyStyle = .plain
    }
    /// Generates a ghost button
    /// mainly used for secondary actions
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                strokeColor : Color,
                icon: String? = nil,
                fullWidth : Bool = false,
                isDisabled: Bool) {
        self.action = action
        self.labeltext = label
        self.labelColor = strokeColor
        self.backgroundColor = .clear
        self.strokeColor = strokeColor
        self.icon = icon
        self.buttonStyle = .ghostButton
        self.fullWidth = fullWidth
        self.isDisabled = isDisabled
        self.iconOnlyStyle = .plain
    }
    
    /// Generates a button with a plain label
    /// mainly used for tertiary actions
    public init(action: @escaping () -> Void,
                label: LocalizedStringKey,
                labelColor: Color,
                icon: String? = nil,
                isDisabled: Bool) {
        self.action = action
        self.labeltext = label
        self.labelColor = labelColor
        self.backgroundColor = .clear
        self.strokeColor = .clear
        self.icon = icon
        self.buttonStyle = .plainButton
        self.fullWidth = false
        self.isDisabled = isDisabled
        self.iconOnlyStyle = .plain
    }
    
    /// Generates a button with an icon only
    public init(action: @escaping () -> Void,
                labelColor: Color,
                iconStyle : IconOnlyButtonStyle,
                icon: String,
                isDisabled: Bool) {
        self.action = action
        self.labeltext = ""
        self.labelColor = labelColor
        self.backgroundColor = .clear
        self.strokeColor = .clear
        self.icon = icon
        self.buttonStyle = .iconOnly
        self.fullWidth = false
        self.isDisabled = isDisabled
        self.iconOnlyStyle = iconStyle
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            switch buttonStyle {
            case .solidButton:
                SolidButton(icon: icon,
                            labeltext: labeltext,
                            labelColor: labelColor,
                            fullWidth: fullWidth,
                            backgroundColor: backgroundColor,
                            isDisabled: isDisabled)
            case .ghostButton:
                GhostButton(icon: icon,
                            labeltext: labeltext,
                            labelColor: labelColor,
                            fullWidth: fullWidth,
                            strokeColor: strokeColor,
                            isDisabled: isDisabled)
            case .plainButton:
                PlainButton(icon: icon,
                            labeltext: labeltext,
                            labelColor: labelColor,
                            isDisabled: isDisabled)
            case .iconOnly:
                IconOnlyButton(iconOnlyStyle: iconOnlyStyle,
                               icon: icon ?? "",
                               labelColor: labelColor,
                               isDisabled: isDisabled)
            }
        }
        .disabled(isDisabled)
        
    }
}

#Preview {
    VStack(spacing: 30) {
        HStack {
            CleanButton(action: {}, label: "Share", labelColor: .white, backgroundColor: .blue, icon: "square.and.arrow.up", fullWidth: true, isDisabled: false)
            CleanButton(action: {}, label: "Share", labelColor: .white, backgroundColor: .blue, icon: nil, fullWidth: false, isDisabled: true)
        }
        HStack {
            CleanButton(action: {}, label: "Delete", strokeColor: .red, icon: "trash", fullWidth: true, isDisabled: false)
            CleanButton(action: {}, label: "Delete", strokeColor: .red, icon: nil, fullWidth: false, isDisabled: true)
        }
        HStack {
            CleanButton(action: {}, label: "Pin", labelColor: .yellow, icon: "pin", isDisabled: false)
            Spacer()
            CleanButton(action: {}, label: "Pin", labelColor: .yellow, icon: nil, isDisabled: true)
        }
        
        HStack {
            CleanButton(action: {}, labelColor: .white, iconStyle: .rectangle(isFilled: true, color: .purple), icon: "lasso", isDisabled: false)
            CleanButton(action: {}, labelColor: .purple, iconStyle: .rectangle(isFilled: false, color: .purple), icon: "lasso", isDisabled: false)
            CleanButton(action: {}, labelColor: .white, iconStyle: .circle(isFilled: true, color: .purple), icon: "lasso", isDisabled: false)
            CleanButton(action: {}, labelColor: .purple, iconStyle: .circle(isFilled: false, color: .purple), icon: "lasso", isDisabled: false)
            CleanButton(action: {}, labelColor: .purple, iconStyle: .plain, icon: "lasso", isDisabled: false)
        }
        HStack {
            CleanButton(action: {}, labelColor: .white, iconStyle: .rectangle(isFilled: true, color: .purple), icon: "lasso", isDisabled: true)
            CleanButton(action: {}, labelColor: .purple, iconStyle: .rectangle(isFilled: false, color: .purple), icon: "lasso", isDisabled: true)
            CleanButton(action: {}, labelColor: .white, iconStyle: .circle(isFilled: true, color: .purple), icon: "lasso", isDisabled: false)
            CleanButton(action: {}, labelColor: .purple, iconStyle: .circle(isFilled: false, color: .purple), icon: "lasso", isDisabled: true)
            CleanButton(action: {}, labelColor: .purple, iconStyle: .plain, icon: "lasso", isDisabled: true)
        }
    }
    .padding()
}
