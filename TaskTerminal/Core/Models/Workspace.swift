//
//  Workspace.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftData

@Model
final class Workspace {
    @Attribute(.unique)
    var id: UUID
    
    var title: String
    var bio: String
    var symbolName: String
    
    var createdAt: Date
    var isArchived: Bool
    
    @Relationship(deleteRule: .cascade, inverse: \WorkspaceMembership.workspace)
    var memberships: [WorkspaceMembership] = []
    
    @Relationship(deleteRule: .cascade, inverse: \WorkspaceTask.workspace)
    var tasks: [WorkspaceTask] = []
    
    init(
        id: UUID = UUID(),
        title: String,
        bio: String = "",
        symbolName: String = "folder",
        createdAt: Date = .now,
        isArchived: Bool = false
    ) {
        self.id = id
        self.title = title
        self.bio = bio
        self.symbolName = symbolName
        self.createdAt = createdAt
        self.isArchived = isArchived
    }
}

extension Workspace {
    var members: [User] {
        memberships.map(\.user)
    }
    
    var activeTasks: [WorkspaceTask] {
        tasks.filter { $0.status != .archived }
    }
    
    var completedTasks: [WorkspaceTask] {
        tasks.filter { $0.status == .done }
    }
    
    var hasNoTasks: Bool {
        self.tasks.isEmpty
    }
    
    var archivedTasks: [WorkspaceTask] {
        tasks.filter { $0.status == .archived }
    }
    
    var createdDisplayDate: String {
        createdAt.formatted(date: .abbreviated, time: .omitted)
    }
}
