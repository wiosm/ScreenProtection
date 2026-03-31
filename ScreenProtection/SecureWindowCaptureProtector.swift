import UIKit

final class SecureWindowCaptureProtector {
    private let secureTextField = UITextField(frame: .zero)
    private var isApplied = false

    func apply(to window: UIWindow) {
        guard !isApplied else { return }
        isApplied = true

        secureTextField.translatesAutoresizingMaskIntoConstraints = false
        secureTextField.isSecureTextEntry = true
        secureTextField.isUserInteractionEnabled = false
        secureTextField.backgroundColor = .clear
        secureTextField.textColor = .clear
        secureTextField.tintColor = .clear
        secureTextField.alpha = 0.01

        window.addSubview(secureTextField)

        NSLayoutConstraint.activate([
            secureTextField.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            secureTextField.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            secureTextField.widthAnchor.constraint(equalToConstant: 1),
            secureTextField.heightAnchor.constraint(equalToConstant: 1)
        ])

        guard
            let superLayer = window.layer.superlayer,
            let secureSubLayer = secureTextField.layer.sublayers?.first
        else {
            return
        }

        superLayer.addSublayer(secureTextField.layer)
        secureSubLayer.addSublayer(window.layer)
    }
}
