import Fluent
import Vapor
import Foundation

let credentialFormatter:DateFormatter = {
    let formatter:DateFormatter = DateFormatter()
    formatter.dateFormat = "EEE MMM dd yyyy HH:mm:ss"
    formatter.locale = Locale(identifier: "en_US_POSIX") // Asegura que use formato de fecha en inglés
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
}()

let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(credentialFormatter)
    return decoder
}()

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("credentials") { Request async -> [CredentialDTO] in
        var credentials: [CredentialDTO] = []
        
        do {
            let currentFilePath = #file
            let projectRootPath = URL(fileURLWithPath: currentFilePath)
                .deletingLastPathComponent() // Remueve el archivo actual
                .deletingLastPathComponent() // Ajusta según la estructura de tu proyecto
                .deletingLastPathComponent()
            let path = projectRootPath.appendingPathComponent("Credentials.json").path

            if FileManager.default.fileExists(atPath: path){
                let url = URL(filePath: path)
                let data = try Data(contentsOf: url)
                
                credentials =  try decoder.decode([CredentialDTO].self, from: data)
            }
        } catch {
            print("Error: \(error)")
            return []
        }
        return credentials
    }

    try app.register(collection: TodoController())
}
