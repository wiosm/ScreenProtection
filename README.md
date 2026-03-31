# ScreenProtection iOS Sample

A minimal iOS 14+ project using **UIKit navigation** with **SwiftUI screens** via `UIHostingViewController`.

## Flow

1. App launches to a SwiftUI login screen hosted inside a UIKit `UINavigationController`.
2. Login screen has:
   - Phone number text field
   - Password text field
   - Confirm button
3. Tapping Confirm pushes a SwiftUI success screen using UIKit navigation.

## Recording protection behavior

The login screen is wrapped in a secure container powered by a secure text-entry canvas.
This keeps login content protected in captured output without observing recording notifications
and without interrupting user interaction.
