//
//  PlainTextButtonInits.swift
//
//
//  Created by Alexander Löwe on 16.01.24.
//

import SwiftUI

extension CleanButton where ButtonColor == Color, ButtonLabel == Text {
    
    public init(_ titleKey: LocalizedStringKey,
                labelColor: LabelColor,
                isDisabled: Bool,
                action : @escaping () -> Void) {
        self.cleanButtonStyle = .plainText
        self.action = action
        self.labelColor = labelColor
        self.fillColor = .clear
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Text(titleKey)
    }
    
    public init<S>(_ title: S,
                labelColor: LabelColor,
                isDisabled: Bool,
                action : @escaping () -> Void) where S : StringProtocol {
        self.cleanButtonStyle = .plainText
        self.action = action
        self.labelColor = labelColor
        self.fillColor = .clear
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Text(title)
    }
}

extension CleanButton where ButtonColor == Color, ButtonLabel == Label<Text,Image> {
    
    public init(_ titleKey: LocalizedStringKey,
                sfImage: String,
                labelColor: LabelColor,
                isDisabled: Bool,
                action : @escaping () -> Void) {
        self.cleanButtonStyle = .plainText
        self.action = action
        self.labelColor = labelColor
        self.fillColor = .clear
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Label(titleKey, systemImage: sfImage)
    }
    
    public init<S>(_ title: S,
                   sfImage: String,
                   labelColor: LabelColor,
                   isDisabled: Bool,
                   action : @escaping () -> Void) where S : StringProtocol {
        self.cleanButtonStyle = .plainText
        self.action = action
        self.labelColor = labelColor
        self.fillColor = .clear
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = .rectangle
        self.isDisabled = isDisabled
        self.label = Label(title, systemImage: sfImage)
    }
}

extension CleanButton where ButtonColor == Color, ButtonLabel == Image {
    
    public init(sfImage: String,
                labelColor: LabelColor,
                isDisabled: Bool,
                action : @escaping () -> Void) {
        self.cleanButtonStyle = .plainText
        self.action = action
        self.labelColor = labelColor
        self.fillColor = .clear
        self.useFullWidth = false
        self.cleanButtonBackgroundShape = .circle
        self.isDisabled = isDisabled
        self.label = Image(systemName: sfImage)
    }
    
}
