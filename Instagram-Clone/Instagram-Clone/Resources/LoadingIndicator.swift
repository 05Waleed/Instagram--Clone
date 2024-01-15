//
//  LoadingIndicator.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 13.01.2024.
//

import UIKit

class LoadingIndicator {
    static var activityIndicator: UIActivityIndicatorView?

    static func show(on view: UIView) {
        // Create and configure the activity indicator
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = view.center
        activityIndicator?.startAnimating()

        // Add the activity indicator to the view
        view.addSubview(activityIndicator!)
    }

    static func hide() {
        // Remove the activity indicator from the superview
        DispatchQueue.main.async {
            self.activityIndicator?.removeFromSuperview()
            self.activityIndicator = nil
        }
    }
}
