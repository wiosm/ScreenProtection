import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack(spacing: 16) {
            if #available(iOS 15.0, *) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 72))
                    .foregroundStyle(.green)
            } else {
                // Fallback on earlier versions
            }

            Text("Login Successful")
                .font(.title)
                .bold()

            Text("You have moved to the next SwiftUI screen via UIKit navigation.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
