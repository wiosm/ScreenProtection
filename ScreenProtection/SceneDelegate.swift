import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let navigationController = UINavigationController()
    private let captureProtector = SecureWindowCaptureProtector()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .systemBackground

        showLogin()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
        captureProtector.apply(to: window)
    }

    private func showLogin() {
        let loginView = LoginView { [weak self] in
            self?.showSuccess()
        }

        let hostingController = UIHostingViewController(rootView: loginView)
        hostingController.title = "Login"
        navigationController.setViewControllers([hostingController], animated: false)
    }

    private func showSuccess() {
        let successView = SuccessView()
        let hostingController = UIHostingViewController(rootView: successView)
        hostingController.title = "Success"

        let secureController = SecureContainerViewController(contentViewController: hostingController)
        secureController.title = hostingController.title
        navigationController.pushViewController(secureController, animated: true)
    }
}
