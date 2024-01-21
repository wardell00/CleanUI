//
//  CleanButton.swift
//  
//
//  Created by Alexander Löwe on 11.01.24.
//

import SwiftUI

public struct CleanButton<LabelColor, ButtonColor, ButtonLabel>: View where ButtonColor : ShapeStyle, LabelColor: ShapeStyle, ButtonLabel : View {
    
    /// Local Parameters
    let cleanButtonStyle : CleanButtonStyle
    
    /// Global Parameters
    let action : () -> Void
    let labelColor : LabelColor
    let fillColor : ButtonColor
    let useFullWidth : Bool
    let cleanButtonBackgroundShape : CleanButtonBackgroundShape
    let isDisabled : Bool
    let label : ButtonLabel
    
    public var body: some View {
        Button { action() }
        label: {
            switch cleanButtonStyle {
            case .solidButton:
                label
                    .foregroundStyle(labelColor)
                    .padding()
                    .buttonWidthModifier(fullWidth: useFullWidth)
                    .background {
                        switch cleanButtonBackgroundShape {
                        case .rectangle:
                            RoundedRectangle(cornerRadius: 10.0)
                                .buttonColorModifier(isDisabled: isDisabled, fillColor: fillColor)
                        case .circle:
                            Circle()
                                .buttonColorModifier(isDisabled: isDisabled, fillColor: fillColor)
                        }
                    }
            case .ghostButton:
                label
                    .buttonColorModifier(isDisabled: isDisabled, fillColor: labelColor)
                    .padding()
                    .buttonWidthModifier(fullWidth: useFullWidth)
                    .background {
                        switch cleanButtonBackgroundShape {
                        case .rectangle:
                            if isDisabled {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(.clear)
                                    .stroke(Color(uiColor: .systemGray3), lineWidth: 2.0)
                            }
                            else {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(.clear)
                                    .stroke(labelColor, lineWidth: 2.0)
                            }
                            
                        case .circle:
                            if isDisabled {
                                Circle()
                                    .fill(.clear)
                                    .stroke(Color(uiColor: .systemGray3), lineWidth: 2.0)
                            }
                            else {
                                Circle()
                                    .fill(.clear)
                                    .stroke(labelColor, lineWidth: 2.0)
                            }
                        }
                    }
            case .plainText:
                label
            }
//            switch cleanButtonStyle {
//            case .solidButton, .ghostButton:
//                Text(titleKey)
//                    .modifier(CleanButtonViewModifier(labelColor: labelColor, fillColor: fillColor, useFullWidth: useFullWidth, cleanButtonStle: cleanButtonStyle, isDisabled: isDisabled))
//            case .solidButtonSfImage, .ghostButtonSfImage:
//                Label(titleKey, systemImage: sfImage)
//                    .modifier(CleanButtonViewModifier(labelColor: labelColor, fillColor: fillColor, useFullWidth: useFullWidth, cleanButtonStle: cleanButtonStyle, isDisabled: isDisabled))
//            case .solidButtonSfImageOnly(_), .ghostButtonSfImageOnly(_):
//                Image(systemName: sfImage)
//                    .modifier(CleanButtonViewModifier(labelColor: labelColor, fillColor: fillColor, useFullWidth: useFullWidth, cleanButtonStle: cleanButtonStyle, isDisabled: isDisabled))
//            }
            
        }
        .disabled(isDisabled)

    }
}


