//
//  CleanContextMenu.swift
//  CleanUIPlayground
//
//  Created by Alexander Löwe on 21.12.23.
//

import Foundation
import SwiftUI
import UIKit

struct CleanContextMenuHelper<Content: View, Preview: View> : UIViewRepresentable {
    
    var content : Content
    var preview: Preview
    var menu: UIMenu
    var navigate: () -> Void
    
    init(content: Content, preview: Preview, menu: UIMenu, navigate: @escaping () -> Void) {
        self.content = content
        self.preview = preview
        self.menu = menu
        self.navigate = navigate
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        
        view.addSubview(hostView.view)
        view.addConstraints(constraints)
        let interaction = UIContextMenuInteraction(delegate: context.coordinator)
        view.addInteraction(interaction)
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    final class Coordinator : NSObject, UIContextMenuInteractionDelegate {
        var parent : CleanContextMenuHelper
        init(parent: CleanContextMenuHelper) {
            self.parent = parent
        }
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            
            return UIContextMenuConfiguration(identifier: nil) {
                let previewController = UIHostingController(rootView: self.parent.preview)
                return previewController
            } actionProvider: { elements in
                return self.parent.menu
            }
        }
        
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
            parent.navigate()
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct CleanContextMenu<Content: View, Preview: View> : View {
    var content : Content
    var preview : Preview
    var menu: UIMenu
    var navigate: () -> Void
    
    init(navigate: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content, @ViewBuilder preview: @escaping () -> Preview, menu: @escaping () -> UIMenu) {
        
        self.content = content()
        self.preview = preview()
        self.menu = menu()
        self.navigate = navigate
    }
    
    var body: some View {
        ZStack {
            content
                
            
        }
        .overlay(CleanContextMenuHelper(content: content, preview: preview, menu: menu, navigate: navigate))
        .background {
            Color.clear
        }
    }
}

extension View {
    func cleanContextMenu<Preview: View>(navigate: @escaping () -> Void, @ViewBuilder preview: @escaping () -> Preview, menu: @escaping () -> UIMenu) -> some View {
        return CleanContextMenu(navigate: navigate, content: {self}, preview: preview, menu: menu)
    }
}

#Preview {
    Text("Hello World")
        .cleanContextMenu {
            
        } preview: {
            Text("Hello World 2")
        } menu: {
            UIMenu(title: "Test", image: nil, identifier: nil, options: .displayAsPalette, children: [])
        }

}

