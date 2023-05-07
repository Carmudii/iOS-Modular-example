//
//  MainTabBar.swift
//  Base Code
//
//  Created by Car mudi on 01/02/23.
//

import Common
import UIKit
import RxSwift
import Home

final class TabBarViewController: UITabBarController {

    typealias ViewModel = AnyViewModel<TabBarViewModel.State, TabBarViewModel.Event>

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    // MARK: - Private Properties

    private let home = Home()
    private let disposeBag = DisposeBag()
    private let viewModel: ViewModel

    // MARK: - Initialization

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
        configureChildViewControllers()
        bindViewModel()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = true
    }

    func navigateToScreenA() {
        viewControllers?
            .compactMap { $0 as? UINavigationController }
            .forEach { $0.popToRootViewController(animated: false) }

        tabBar.isHidden = false
        selectedIndex = TabBarViewModel.Tab.tabA.rawValue
    }

    func navigateToScreenB() {
        viewControllers?
            .compactMap { $0 as? UINavigationController }
            .forEach { $0.popToRootViewController(animated: false) }

        tabBar.isHidden = false
        selectedIndex = TabBarViewModel.Tab.tabB.rawValue
    }

    // MARK: - Private Methods

    private func bindViewModel() {
        viewModel.state
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .subscribe(onNext: { (viewController, state) in

                switch state {
                case .tabA:
                    break
                case .tabB:
                    break
                }
            })
            .disposed(by: disposeBag)
    }

    private func configureTabBar() {
        tabBar.tintColor = .tabBarIconActive
        tabBar.unselectedItemTintColor = .tabBarIconInactive
        tabBar.barTintColor = .tabBarBackground
        tabBar.isTranslucent = false

        if #available(iOS 15, *) {
            let tabBarApperance = UITabBarAppearance()
            tabBarApperance.configureWithOpaqueBackground()
            tabBarApperance.backgroundColor = .tabBarBackground

            UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
            UITabBar.appearance().standardAppearance = tabBarApperance
        }
    }

    private func configureChildViewControllers() {

        viewControllers = TabBarViewModel.Tab.allCases.map { tab -> UIViewController in

            switch tab {
            case .tabA:
                return createFeatureAViewController()
            case .tabB:
                return createFeatureBViewController()
            }
        }
    }

    private func createFeatureAViewController() -> UIViewController {
        let feature = home.makeViewController()
        let icon = UIImage(named: "iconHomeStroke")
        let selectedIcon = UIImage(named: "iconHomeFill")
        let item = UITabBarItem(
            title: "Tab A",
            image: icon?.withTintColor(.tabBarIconInactive, renderingMode: .alwaysTemplate),
            selectedImage: selectedIcon?.withTintColor(.tabBarIconActive, renderingMode: .alwaysTemplate)
        )

        feature.tabBarItem = item

        return RotationRestrictedNavigationController(rootViewController: feature)
    }

    private func createFeatureBViewController() -> UIViewController {
        let feature = UIViewController()
        let icon = UIImage(named: "iconHomeStroke")
        let selectedIcon = UIImage(named: "iconHomeFill")
        let item = UITabBarItem(
            title: "Tab B",
            image: icon?.withTintColor(.tabBarIconInactive, renderingMode: .alwaysTemplate),
            selectedImage: selectedIcon?.withTintColor(.tabBarIconActive, renderingMode: .alwaysTemplate)
        )

        feature.tabBarItem = item

        return RotationRestrictedNavigationController(rootViewController: feature)
    }
}
