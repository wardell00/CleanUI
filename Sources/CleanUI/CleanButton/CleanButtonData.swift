//
//  File.swift
//  
//
//  Created by Alexander Löwe on 27.12.23.
//

import Foundation
import SwiftUI



public enum CleanButtonBackgroundShape {
    case rectangle
    case circle
}

enum CleanButtonStyle {
    case solidButton
    case ghostButton
    case plainText
    
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

fileprivate struct ButtonColorModifer<FillColor> : ViewModifier where FillColor : ShapeStyle {
    
    let isDisabled : Bool
    let fillColor : FillColor
    
    func body(content: Content) -> some View {
        if isDisabled {
            content
                .foregroundStyle(Color(uiColor: .systemGray3))
        }
        else {
            content
                .foregroundStyle(fillColor)
        }
    }
}

extension View {
    func buttonWidthModifier(fullWidth : Bool) -> some View {
        modifier(ButtonWidthModifier(fullWidth: fullWidth))
    }
    
    func buttonColorModifier<T : ShapeStyle>(isDisabled : Bool, fillColor : T) -> some View {
        modifier(ButtonColorModifer(isDisabled: isDisabled, fillColor: fillColor))
    }
}

