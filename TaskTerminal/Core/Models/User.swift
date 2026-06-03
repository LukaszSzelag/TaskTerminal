//
//  User.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftData

@Model
final class User {
    @Attribute(.unique)
    var id: UUID
    
    var name: String
    var lastName: String
    var bio: String
    var email: String?
    var imageData: Data?
    
    @Relationship(deleteRule: .cascade, inverse: \WorkspaceMembership.user)
    var memberships: [WorkspaceMembership] = []
    
    @Relationship(deleteRule: .nullify, inverse: \WorkspaceTask.assignee)
    var assignedTasks: [WorkspaceTask] = []
    
    @Relationship(deleteRule: .nullify, inverse: \WorkspaceTask.creator)
    var createdTasks: [WorkspaceTask] = []
    
    init(
        id: UUID = UUID(),
        name: String,
        lastName: String,
        bio: String = "",
        email: String? = nil,
        imageData: Data? = nil
    ) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.bio = bio
        self.email = email
        self.imageData = imageData
    }
}

extension User {
    var displayName: String {
        return "\(name) \(lastName)"
    }
    
    var initials: String {
        guard let firstLetter = name.first, let lastLetter = lastName.first else {
            return ""
        }
        return "\(firstLetter)\(lastLetter)".uppercased()
    }
    
    var hasImage: Bool {
        imageData != nil
    }
    
    var hasEmail: Bool {
        email != nil
    }
    
    var hasBio: Bool {
        !bio.isEmpty
    }
}
