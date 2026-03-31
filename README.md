# ScreenProtection iOS Sample

A minimal iOS 14+ project using **UIKit navigation** with **SwiftUI screens** via `UIHostingViewController`.

## Flow

1. App launches to a SwiftUI login screen hosted inside a UIKit `UINavigationController`.
2. Login screen has:
   - Phone number text field
   - Password text field
   - Confirm button
3. Tapping Confirm pushes a SwiftUI success screen using UIKit navigation.

## Notes

- Navigation ownership remains in UIKit (`UINavigationController`).
- SwiftUI screens are hosted via a custom `UIHostingViewController`.
## Recording protection behavior

The login screen is wrapped in a secure container powered by a secure text-entry canvas.
This keeps login content protected in captured output without observing recording notifications
and without interrupting user interaction.

Additionally, the app applies an experimental secure-window protection layer to the main `UIWindow` to improve capture redaction coverage for system-rendered surfaces such as the keyboard.
