//
//  SwiftUIView.swift
//  
//
//  Created by Alexander Löwe on 11.01.24.
//

import SwiftUI

extension CleanButton where ButtonLabel == Text {
    
    /// Creates a Solid Button with a Text Label generated
    /// with a localized string.
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - labelColor: The Color of the Text Label. It can be of type Color or AnyGradient.
    ///    - fillColor: The Color of the Background. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey,
                labelColor: LabelColor,
                fillColor: ButtonColor,
                useFullWidth: Bool = true,
                isDisabled: Bool = false,
                action: @escaping () -> Void) {
        self.cleanButtonStyle = .solidButton
        self.action = action
        self.labelColor = labelColor
        self.fillColor = fillColor
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Text(titleKey)
    }
    
    /// Creates a Solid Button with a Text Label generated
    /// with a String.
    ///
    /// - Parameters:
    ///    - title: A title generated from a string.
    ///    - labelColor: The Color of the Text Label. It can be of type Color or AnyGradient.
    ///    - fillColor: The Color of the Background. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init<S>(_ title: S,
                   labelColor: LabelColor,
                   fillColor: ButtonColor,
                   useFullWidth: Bool = true,
                   isDisabled: Bool = false,
                   action: @escaping () -> Void) where S : StringProtocol {
        self.cleanButtonStyle = .solidButton
        self.action = action
        self.labelColor = labelColor
        self.fillColor = fillColor
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Text(title)
    }
}


extension CleanButton where ButtonLabel == Label<Text,Image> {
    
    /// Creates a Solid Button with a Text Label and a SfImage generated
    /// with a localized string.
    ///
    /// - Parameters:
    ///    - titleKey: A title generated from a localized string.
    ///    - sfImage: A string representing a SfImage.
    ///    - labelColor: The Color of the Label. It can be of type Color or AnyGradient.
    ///    - fillColor: The Color of the Background. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init(_ titleKey: LocalizedStringKey,
                sfImage: String,
                labelColor: LabelColor,
                fillColor: ButtonColor,
                useFullWidth: Bool = true,
                isDisabled: Bool = false,
                action: @escaping () -> Void) {
        self.cleanButtonStyle = .solidButton
        self.action = action
        self.labelColor = labelColor
        self.fillColor = fillColor
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Label(titleKey, systemImage: sfImage)
    }
    
    /// Creates a Solid Button with a Text Label and a SfImage generated
    /// with a string.
    ///
    /// - Parameters:
    ///    - title: A title generated from a string.
    ///    - sfImage: A string representing a SfImage.
    ///    - labelColor: The Color of the Label. It can be of type Color or AnyGradient.
    ///    - fillColor: The Color of the Background. It can be of type Color or AnyGradient.
    ///    - useFullWidth: A boolean. Indicates if the button should use all available space or just the space it needs.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init<S>(_ title: S,
                sfImage: String,
                labelColor: LabelColor,
                fillColor: ButtonColor,
                useFullWidth: Bool = true,
                isDisabled: Bool = false,
                   action: @escaping () -> Void) where S: StringProtocol{
        self.cleanButtonStyle = .solidButton
        self.action = action
        self.labelColor = labelColor
        self.fillColor = fillColor
        self.useFullWidth = useFullWidth
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Label(title, systemImage: sfImage)
    }
}

extension CleanButton where ButtonLabel == Image {
    
    /// Creates a Solid Button with a SFImage as its Label
    ///
    /// - Parameters:
    ///    - sfImage: A string representing a SfImage.
    ///    - backgroundShape: The shape of the background. Either a Rectangle or a Circle.
    ///    - labelColor: The Color of the SfImage. It can be of type Color or AnyGradient.
    ///    - fillColor: The Color of the Background. It can be of type Color or AnyGradient.
    ///    - isDisabled: Indicates if the Button is disabled or not.
    ///    - action: The action to perform when the user triggers the button.
    public init(sfImage: String,
                backgroundShape : CleanButtonBackgroundShape,
                labelColor: LabelColor,
                fillColor: ButtonColor,
                isDisabled: Bool = false,
                action: @escaping () -> Void) {
        self.cleanButtonStyle = .solidButton
        self.action = action
        self.labelColor = labelColor
        self.fillColor = fillColor
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = backgroundShape
        self.isDisabled = isDisabled
        self.label = Image(systemName: sfImage)
    }
}
