//
//  UIViewController.swift
//  
//
//  Created by Car mudi on 01/02/23.
//

import UIKit
import RxSwift

public final class RotationRestrictedNavigationController: UINavigationController {

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

open class BaseViewController: UIViewController {

    public let disposeBag = DisposeBag()

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    public init() {

        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))

        super.init(nibName: nibName, bundle: bundle)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background

        configureNavigationBar()
    }

    public func configureNavigationBar(
        title: String = "",
        subtitle: String? = nil,
        barTintColor: UIColor = .navigationBarBackground,
        leftNavigationItems: [UIBarButtonItem] = [],
        rightNavigationItems: [UIBarButtonItem] = []
    ) {

        configureNavigationBar(title: title, subtitle: subtitle)

        navigationItem.leftBarButtonItems = leftNavigationItems
        navigationItem.rightBarButtonItems = rightNavigationItems

        if leftNavigationItems.isEmpty {
            navigationItem.setHidesBackButton(true, animated: false)
        }

        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.backgroundColor = barTintColor

            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = barTintColor
        }

    }

    // MARK: - Private Methods

    private func configureNavigationBar() {

        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.myriadProSemibold(size: 17),
            .foregroundColor: UIColor.navigationBarBackground
        ]

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .navigationBarBackground
        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    private func configureNavigationBar(title: String, subtitle: String?) {

        let screenWidth = UIScreen.main.bounds.width

        guard subtitle != nil else {
            navigationItem.title = title
            navigationItem.titleView = nil
            return
        }

        let titleViewWidthRatio: CGFloat = (375 - 60 * 2) / 375
        let titleViewWidth = titleViewWidthRatio * screenWidth

        let titleLabel = UILabel(frame: CGRect(x: 0, y: -5, width: titleViewWidth, height: 17))
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .navigationBarBackground
        titleLabel.font = .myriadProSemibold(size: 17)
        titleLabel.text = title
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.numberOfLines = 1

        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: titleViewWidth, height: 12))
        subtitleLabel.textAlignment = .center
        subtitleLabel.backgroundColor = .clear
        subtitleLabel.textColor = .navigationBarBackground
        subtitleLabel.font = .myriadProRegular(size: 12)
        subtitleLabel.text = subtitle
        subtitleLabel.lineBreakMode = .byTruncatingTail
        subtitleLabel.numberOfLines = 1

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: titleViewWidth, height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)

        navigationItem.title = nil
        navigationItem.titleView = titleView
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {

    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        true
    }

    public func replaceCurrentViewController(viewController: UIViewController) {

        guard var viewControllers = self.navigationController?.viewControllers else {
            return
        }

        viewControllers[viewControllers.count - 1] = viewController
        self.navigationController?.setViewControllers(viewControllers, animated: false)
    }
}
