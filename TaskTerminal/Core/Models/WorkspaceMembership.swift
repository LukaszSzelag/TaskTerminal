//
//  WorkspaceMembership.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftData

@Model
final class WorkspaceMembership {
    @Attribute(.unique)
    var id: UUID
    
    var workspace: Workspace
    var user: User
    
    var role: WorkspaceRole
    var joinedAt: Date
    
    init(
        id: UUID = UUID(),
        workspace: Workspace,
        user: User,
        role: WorkspaceRole = .member,
        joinedAt: Date = .now
    ) {
        self.id = id
        self.workspace = workspace
        self.user = user
        self.role = role
        self.joinedAt = joinedAt
    }
}

extension WorkspaceMembership {
    var isOwner: Bool {
        role == .owner
    }
    
    var displayDate: String {
        return joinedAt.formatted(date: .abbreviated, time: .omitted)
    }
}
