//
//  File.swift
//  MyAPIRest
//
//  Created by Gamero Bejines, Jose Francisco on 25/11/24.
//

import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Credential: Model, @unchecked Sendable {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "issuer")
    var issuer: String
    
    @Field(key: "typeOfCredential")
    var typeOfCredential: String
    
    @Field(key: "icon")
    var icon: String

    init() { }

    init(id: UUID? = nil, issuer: String, typeOfCredential: String, icon: String) {
        self.id = id
        self.issuer = issuer
        self.typeOfCredential = typeOfCredential
        self.icon = icon
    }
    
//    func toDTO() -> CredentialDTO {
//        .init(
//            id: self.id,
//            issuer: self.$issuer.value,
//            typeOfCredential: self.$typeOfCredential.value,
//            icon: self.$icon.value
//        )
//    }
}

//enum MilestoneType:String, Codable {
//  case shared = "Compartida"
//  case sharedInvalidExpired = "Expirada"
//  case error = "Error"
//  case unknown = "Desconocida"
//}
//
//struct Credential: Codable, Hashable, Identifiable{
//    let id: UUID = UUID()
//    let APIId: String
//    let typeOfCredential: String
//    let icon: String
//    let issueDate: Date
//    let expirationDate: Date
//    let state: CredentialState
//    let credentialColor: String
//    let issuer: String
//
//    enum CodingKeys: String, CodingKey{
//        case typeOfCredential, icon, issueDate, expirationDate, state, credentialColor, issuer
//        case APIId = "id"
//    }
//}
