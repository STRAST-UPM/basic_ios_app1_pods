import Foundation
import Alamofire
import Kingfisher
import FirebaseAuth
import SwiftyJSON
import SnapKit

class LibraryManager {
    private var callIndex = 0  // Índice para alternar las llamadas

    func callLibraryFunction() -> String {
        let functions: [(String, () -> Void)] = [
            ("Alamofire", callAlamofire),
            ("Kingfisher", callKingfisher),
            ("FirebaseAuth", callFirebaseAuth),
            ("SwiftyJSON", callSwiftyJSON),
            ("SnapKit", callSnapKit)
        ]

        let (libraryName, function) = functions[callIndex % functions.count]
        
        function() // Ejecutar la función

        callIndex += 1 // Incrementar el índice para la próxima vez

        return libraryName
    }

    private func callAlamofire() {
        guard !isRunningInPreview else {
            print("Alamofire no se ejecuta en Preview")
            return
        }
        print("Llamando a Alamofire: Haciendo una petición HTTP GET a example.com")
        AF.request("https://example.com").response { response in
            print("Respuesta de Alamofire: \(response.response?.statusCode ?? -1)")
        }
    }

    private func callKingfisher() {
        print("Llamando a Kingfisher: Mostrando imagen de ejemplo")
        // No se puede demostrar en consola, pero aquí se cargaría una imagen en una UIImageView con KF
    }

    private func callFirebaseAuth() {
        guard !isRunningInPreview else {
            print("FirebaseAuth no se ejecuta en Preview")
            return
        }
        print("Llamando a FirebaseAuth: Mostrando usuario actual")
        let user = Auth.auth().currentUser
        print("Usuario actual: \(user?.email ?? "Ninguno")")
    }

    private func callSwiftyJSON() {
        print("Llamando a SwiftyJSON: Parseando JSON")
        let jsonString = "{\"nombre\": \"Ines\", \"edad\": 25}"
        if let data = jsonString.data(using: .utf8) {
            let json = try? JSON(data: data)
            print("Nombre: \(json?["nombre"].stringValue ?? "Desconocido")")
        }
    }

    private func callSnapKit() {
        print("Llamando a SnapKit: Configurando constraints (solo demostrativo)")
        // SnapKit se usa en la UI, no en consola, pero aquí se harían las configuraciones de AutoLayout
    }

    /// Detecta si el código se está ejecutando en Xcode Preview
    private var isRunningInPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
