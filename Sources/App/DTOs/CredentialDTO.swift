import Fluent
import Vapor

enum CredentialState: String, Codable {
    case available = "available"
    case requested = "requested"
    case revoked = "revoked"
    case expired = "expired"
}

struct CredentialDTO: Content {
    var id: String?
    var typeOfCredential: String?
    var icon: String?
    var issueDate: Date?
    var expirationDate: Date?
    var state: CredentialState?
    var credentialColor: String?
    var issuer: String?
    
//    func toModel() -> Credential {
//        let model = Credential()
//        
//        model.id = self.id
//        if let issuer = self.issuer {
//            model.issuer = issuer
//        }
//        if let typeOfCredential = self.typeOfCredential {
//            model.typeOfCredential = typeOfCredential
//        }
//        if let icon = self.icon {
//            model.icon = icon
//        }
//        return model
//    }
}
