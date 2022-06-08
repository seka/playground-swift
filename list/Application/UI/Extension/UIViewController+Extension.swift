//
//  UIViewController+Extension.swift
//  List
//
//  Created by shin.sekaryo on 2022/06/08.
//

import UIKit
import SwiftUI

extension UIViewController {
    @discardableResult func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) -> UIViewController where Content: View {
        let hostingController = UIHostingController(rootView: swiftUIView)

        /// Add as a child of the current view controller.
        addChild(hostingController)

        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)

        /// Setup the constraints to update the SwiftUI view boundaries.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor),
        ]
        NSLayoutConstraint.activate(constraints)

        /// Notify the hosting controller that it has been moved to the current view controller.
        hostingController.didMove(toParent: self)

        return hostingController
    }
    
    func removeAllSubUIView(from view: UIView) {
        // FIXME: UIHostingController<AnyView> で削除できないので embed されている UIViewController を全て削除する
        // UIHostingController が UIViewController を継承している
        for child in children {
            child.willMove(toParent: nil)
        }
        view.subviews.forEach { $0.removeFromSuperview() }
        for child in children {
            child.removeFromParent()
        }
    }
}
