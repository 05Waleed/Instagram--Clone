//
//  BaseTabBarViewController.swift
//  Instagram-Clone
//
//  Created by Muhammad Waleed on 06.01.2024.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            let appearance = tabBar.standardAppearance
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor.darkGray
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.label
            tabBar.standardAppearance = appearance
        }
    }
}
