//
//  AppDelegate.swift
//  Base Code
//
//  Created by Car mudi on 31/01/23.
//

import Common
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureRootViewController()

        return true
    }

    private func configureRootViewController() {
        let viewModel = TabBarViewModel()
        let viewController = TabBarViewController(viewModel: AnyViewModel(viewModel))

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
    }
}

