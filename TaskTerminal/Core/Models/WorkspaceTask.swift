//
//  Task.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftData

@Model
final class WorkspaceTask {
    @Attribute(.unique)
    var id: UUID
    
    var title: String
    var bio: String
    
    var createdAt: Date
    var startDate: Date?
    var dueDate: Date?
    
    var status: TaskStatus
    var priority: TaskPriority
    
    var workspace: Workspace
    
    var creator: User?
    var assignee: User?
    
    init(
        id: UUID = UUID(),
        title: String,
        bio: String = "",
        createdAt: Date = .now,
        startDate: Date? = nil,
        dueDate: Date? = nil,
        status: TaskStatus = .todo,
        priority: TaskPriority = .medium,
        workspace: Workspace,
        creator: User? = nil,
        assignee: User? = nil
    ) {
        self.id = id
        self.title = title
        self.bio = bio
        self.createdAt = createdAt
        self.startDate = startDate
        self.dueDate = dueDate
        self.status = status
        self.priority = priority
        self.workspace = workspace
        self.creator = creator
        self.assignee = assignee
    }
}

extension WorkspaceTask {
    var hasAssignee: Bool {
        return assignee != nil
    }
    
    var hasCreator: Bool {
        return creator != nil
    }
    
    var hasBio: Bool {
        return !bio.isEmpty
    }
    
    var createdDisplayDate: String {
        createdAt.formatted(date: .abbreviated, time: .omitted)
    }
    
    var startDisplayDate: String? {
        startDate?.formatted(date: .abbreviated, time: .omitted)
    }
    
    var dueDisplayDate: String? {
        dueDate?.formatted(date: .abbreviated, time: .omitted)
    }
}
