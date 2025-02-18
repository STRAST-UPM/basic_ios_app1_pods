import SwiftUI

struct ContentView: View {
    private let libraryManager = LibraryManager()
    @State private var lastLibraryCalled = ""


    var body: some View {
        VStack {
            Text("Bienvenido a la App")
                .font(.title)
                .padding()

            Button("Llamar a la Librería") {
                lastLibraryCalled = libraryManager.callLibraryFunction()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Última librería llamada: \(lastLibraryCalled)")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
