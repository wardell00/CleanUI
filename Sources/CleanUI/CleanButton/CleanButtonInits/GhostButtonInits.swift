//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Löwe on 14.01.24.
//

import SwiftUI

extension CleanButton where ButtonColor == Color, ButtonLabel == Text {
    
    /// Creates a Ghost Button with a Text Label generated
    /// with a localized string.
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - strokeColor: The Color of the Text Label and its stroke. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey,
                strokeColor: LabelColor,
                useFullWidth: Bool = true,
                isDisabled: Bool = false,
                action: @escaping () -> Void) {
        self.cleanButtonStyle = .ghostButton
        self.action = action
        self.labelColor = strokeColor
        self.fillColor = .clear
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Text(titleKey)
    }
    
    /// Creates a Ghost Button with a Text Label generated
    /// with a  String.
    ///
    /// - Parameters:
    ///    - title: A title generated from a string.
    ///    - labelColor: The Color of the Text Label and its stroke. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init<S>(_ title: S,
                   strokeColor: LabelColor,
                   useFullWidth: Bool = true,
                   isDisabled: Bool = false,
                   action: @escaping () -> Void) where S : StringProtocol {
        self.cleanButtonStyle = .ghostButton
        self.action = action
        self.labelColor = strokeColor
        self.fillColor = .clear
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Text(title)
    }
}

extension CleanButton where ButtonColor == Color, ButtonLabel == Label<Text, Image> {
    
    /// Creates a Ghost Button with a Text Label and a SfImage generated
    /// with a localized string.
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - sfImage: A string representing a SfImage.
    ///    - strokeColor: The Color of the Label and its stroke. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey,
                sfImage : String,
                strokeColor: LabelColor,
                useFullWidth: Bool = true,
                isDisabled: Bool = false,
                action: @escaping () -> Void) {
        self.cleanButtonStyle = .ghostButton
        self.action = action
        self.labelColor = strokeColor
        self.fillColor = .clear
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Label(titleKey, systemImage: sfImage)
    }
    
    /// Creates a Ghost Button with a Text Label  and a SfImage generated
    /// with a  String.
    ///
    /// - Parameters:
    ///    - title: A title generated from a string.
    ///    - sfImage: A string representing a SfImage.
    ///    - labelColor: The Color of the Label and its stroke. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init<S>(_ title: S,
                   sfImage : String,
                   strokeColor: LabelColor,
                   useFullWidth: Bool = true,
                   isDisabled: Bool = false,
                   action: @escaping () -> Void) where S : StringProtocol {
        self.cleanButtonStyle = .ghostButton
        self.action = action
        self.labelColor = strokeColor
        self.fillColor = .clear
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label =  Label(title, systemImage: sfImage)
    }
}


extension CleanButton where ButtonColor == Color, ButtonLabel == Image {
    
    /// Creates a Solid Button with a SFImage as its Label
    ///
    /// - Parameters:
    ///    - sfImage: A string representing a SfImage.
    ///    - backgroundShape: The shape of the background. Either a Rectangle or a Circle.
    ///    - strokeColor: The Color of the SfImage and its stroke. It can be of type Color or AnyGradient.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init(sfImage: String,
                backgroundShape : CleanButtonBackgroundShape,
                strokeColor: LabelColor,
                isDisabled: Bool = false,
                action: @escaping () -> Void) {
        self.cleanButtonStyle = .ghostButton
        self.action = action
        self.labelColor = strokeColor
        self.fillColor = .clear
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = backgroundShape
        self.isDisabled = isDisabled
        self.label = Image(systemName: sfImage)
    }
}
