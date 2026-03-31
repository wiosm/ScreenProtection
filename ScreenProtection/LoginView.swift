import SwiftUI

struct LoginView: View {
    @State private var phoneNumber = ""
    @State private var password = ""

    let onConfirm: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Please Login")
                .font(.largeTitle)
                .bold()

            TextField("Phone Number", text: $phoneNumber)
                .keyboardType(.phonePad)
                .textContentType(.telephoneNumber)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button(action: onConfirm) {
                Text("Confirm")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(onConfirm: {})
    }
}
