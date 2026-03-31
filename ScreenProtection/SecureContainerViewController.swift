import UIKit

final class SecureContainerViewController: UIViewController {
    private let contentViewController: UIViewController
    private let secureTextField = UITextField()

    init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSecureContainer()
        embedContentController()
    }

    private func setupSecureContainer() {
        view.backgroundColor = .systemBackground

        secureTextField.translatesAutoresizingMaskIntoConstraints = false
        secureTextField.isSecureTextEntry = true
        secureTextField.backgroundColor = .clear

        view.addSubview(secureTextField)

        NSLayoutConstraint.activate([
            secureTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secureTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secureTextField.topAnchor.constraint(equalTo: view.topAnchor),
            secureTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func embedContentController() {
        addChild(contentViewController)

        guard let secureCanvasView = secureTextField.subviews.first else {
            contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contentViewController.view)
            NSLayoutConstraint.activate([
                contentViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                contentViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                contentViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
                contentViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            contentViewController.didMove(toParent: self)
            return
        }

        secureCanvasView.isUserInteractionEnabled = true
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        secureCanvasView.addSubview(contentViewController.view)

        NSLayoutConstraint.activate([
            contentViewController.view.leadingAnchor.constraint(equalTo: secureCanvasView.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: secureCanvasView.trailingAnchor),
            contentViewController.view.topAnchor.constraint(equalTo: secureCanvasView.topAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: secureCanvasView.bottomAnchor)
        ])

        contentViewController.didMove(toParent: self)
    }
}
