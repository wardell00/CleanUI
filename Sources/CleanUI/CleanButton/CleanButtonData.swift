//
//  File.swift
//  
//
//  Created by Alexander Löwe on 27.12.23.
//

import Foundation
import SwiftUI

@frozen
enum CleanButtonStyle: CaseIterable {
    case solidButton, ghostButton, plainButton, iconOnly
}

@frozen
public enum IconOnlyButtonStyle {
    case rectangle(isFilled: Bool, color : Color)
    case circle(isFilled: Bool, color : Color)
    case plain
}

fileprivate struct ButtonWidthModifier : ViewModifier {
    
    let fullWidth: Bool
    
    func body(content: Content) -> some View {
        if fullWidth {
            content
                .frame(maxWidth: .infinity)
        }
        else {
            content
        }
    }
}

fileprivate extension View {
    func buttonWidthModifier(fullWidth : Bool) -> some View {
        modifier(ButtonWidthModifier(fullWidth: fullWidth))
    }
}

fileprivate func buttonColor(isDisabled: Bool, color : Color) -> Color {
    return isDisabled ? Color(uiColor: UIColor.systemGray3) : color
}

struct ButtonLabel : View {
    let icon : String?
    let labeltext : LocalizedStringKey
    let labelColor : Color
    var body: some View {
        if let icon {
            Label(labeltext, systemImage: icon)
                .foregroundStyle(labelColor)
        }
        else {
            Text(labeltext)
                .foregroundStyle(labelColor)
        }
    }
}

struct SolidButton : View {
    let icon : String?
    let labeltext : LocalizedStringKey
    let labelColor : Color
    let fullWidth : Bool
    let backgroundColor : Color
    let isDisabled : Bool
    var body: some View {
        ButtonLabel(icon: icon, labeltext: labeltext, labelColor: labelColor)
            .foregroundStyle(labelColor)
            .buttonWidthModifier(fullWidth: fullWidth)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(buttonColor(isDisabled: isDisabled, color: backgroundColor))
            }
    }
}

struct GhostButton : View {
    let icon : String?
    let labeltext : LocalizedStringKey
    let labelColor : Color
    let fullWidth : Bool
    let strokeColor : Color
    let isDisabled : Bool
    var body: some View {
        ButtonLabel(icon: icon, labeltext: labeltext, labelColor: buttonColor(isDisabled: isDisabled, color: labelColor))
            .padding()
            .buttonWidthModifier(fullWidth: fullWidth)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
                    .stroke(buttonColor(isDisabled: isDisabled, color: strokeColor), lineWidth: 2.0)
            }
    }
}

struct PlainButton : View {
    let icon : String?
    let labeltext : LocalizedStringKey
    let labelColor : Color
    let isDisabled : Bool
    var body: some View {
        ButtonLabel(icon: icon, labeltext: labeltext, labelColor: buttonColor(isDisabled: isDisabled, color: labelColor))
    }
}

struct IconOnlyButton : View {
    let iconOnlyStyle : IconOnlyButtonStyle
    let icon : String
    let labelColor : Color
    let isDisabled : Bool
    var body: some View {
        switch iconOnlyStyle {
        case .rectangle(let isFilled, let color):
            Image(systemName: icon)
                .foregroundStyle(isFilled ? labelColor : buttonColor(isDisabled: isDisabled, color: color))
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isFilled ? buttonColor(isDisabled: isDisabled, color: color) : .clear)
                        .stroke(buttonColor(isDisabled: isDisabled, color: color), lineWidth: 2.0)
                }
        case .circle(let isFilled, let color):
            Image(systemName: icon)
                .foregroundStyle(isFilled ? labelColor : buttonColor(isDisabled: isDisabled, color: color))
                .padding()
                .background {
                    Circle()
                        .fill(isFilled ? buttonColor(isDisabled: isDisabled, color: color) : .clear)
                        .stroke(buttonColor(isDisabled: isDisabled, color: color), lineWidth: 2.0)
                }
        case .plain:
            Image(systemName: icon)
                .foregroundStyle(buttonColor(isDisabled: isDisabled, color: labelColor))
        }
    }
}
