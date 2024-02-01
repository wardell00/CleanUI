//
//  CleanButton.swift
//
//
//  Created by Alexander Löwe on 27.12.23.
//

import SwiftUI

struct CleanButtonTesting: View {
    
    let localized : LocalizedStringKey = "Localized : Hello"
    let string : String = "String : Hello"
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 40) {
                
                VStack(alignment: .leading) {
                    Text("Solid Button")
                        .font(.largeTitle)
                    HStack {
                        CleanButton(localized, labelColor: .white, fillColor: .purple.gradient, action: {})
                        CleanButton(string, labelColor: .white, fillColor: .purple.gradient, isDisabled: true, action: {})
                    }
                    HStack {
                        CleanButton(localized, sfImage: "figure.wave",labelColor: .white, fillColor: .purple, action: {})
                        CleanButton(string,sfImage: "figure.wave", labelColor: .white, fillColor: .pink, isDisabled: true, action: {})
                    }
                    HStack {
                        CleanButton(sfImage: "xmark", backgroundShape: .rectangle, labelColor: .white, fillColor: .red, action: {})
                        CleanButton(sfImage: "xmark", backgroundShape: .rectangle, labelColor: .white, fillColor: .red, isDisabled: true, action: {})
                        CleanButton(sfImage: "checkmark", backgroundShape: .circle, labelColor: .white, fillColor: .green, action: {})
                        CleanButton(sfImage: "checkmark", backgroundShape: .circle, labelColor: .white, fillColor: .green, isDisabled: true, action: {})
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Ghost Button")
                        .font(.largeTitle)
                    HStack {
                        CleanButton(localized, strokeColor: .pink, action: {})
                        CleanButton(string, strokeColor: .pink, isDisabled: true, action: {})
                    }
                    HStack {
                        CleanButton(localized, sfImage: "figure.wave", strokeColor: .pink, action: {})
                        CleanButton(string,sfImage: "figure.wave", strokeColor: .pink, isDisabled: true, action: {})
                    }
                    HStack {
                        CleanButton(sfImage: "xmark", backgroundShape: .rectangle, strokeColor: .red, action: {})
                        CleanButton(sfImage: "xmark", backgroundShape: .rectangle, strokeColor: .red, isDisabled: true, action: {})
                        CleanButton(sfImage: "checkmark", backgroundShape: .circle, strokeColor: .green, action: {})
                        CleanButton(sfImage: "checkmark", backgroundShape: .circle, strokeColor: .green, isDisabled: true, action: {})
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Plain Button")
                        .font(.largeTitle)
                    HStack {
                        CleanButton(string, labelColor: .pink, isDisabled: false, action: {})
                        CleanButton(localized, labelColor: .pink, isDisabled: false, action: {})
                        CleanButton(localized, sfImage : "trash", labelColor: .pink, isDisabled: false, action: {})
                        CleanButton(sfImage: "trash", labelColor: .red.gradient, isDisabled: false, action: {})
                        CleanButton(sfImage: "trash", labelColor: .red.gradient, isDisabled: true, action: {})
                    }
                }
            }
        }
        
    }
}

#Preview {
    CleanButtonTesting()
        .padding()
}
