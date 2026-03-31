import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .systemBackground

        let navigationController = UINavigationController(rootViewController: makeLoginViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        self.window = window
    }

    private func makeLoginViewController() -> UIViewController {
        let loginView = LoginView { [weak self] in
            self?.showSuccess()
        }

        let hostingController = UIHostingViewController(rootView: loginView)
        hostingController.title = "Login"
        return hostingController
    }

    private func showSuccess() {
        guard let navigationController = window?.rootViewController as? UINavigationController else {
            return
        }

        let successView = SuccessView()
        let hostingController = UIHostingViewController(rootView: successView)
        hostingController.title = "Success"
        navigationController.pushViewController(hostingController, animated: true)
    }
}
