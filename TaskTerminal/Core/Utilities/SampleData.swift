//
//  SampleData.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftData

struct SampleData {
    static let user: User = .init(
        name: "John",
        lastName: "Doe",
        bio: "First user to ever use this app.",
        email: "john.doe@example.com",
        imageData: nil
    )
    
    static let workspace: Workspace = .init(
        title: "Example Workspace",
        bio: "First workspace ever created. Example workspace.",
        symbolName: "desktopcomputer",
        createdAt: .now,
        isArchived: false
    )
    
    static let workspaceMembership: WorkspaceMembership = .init(
        workspace: workspace,
        user: user,
        role: .owner,
        joinedAt: .now
    )
    
    static let workspaceTask: WorkspaceTask = .init(
        title: "First task",
        bio: "Just an example task for UI purposes.",
        createdAt: .now,
        startDate: nil,
        dueDate: nil,
        status: .todo,
        priority: .low,
        workspace: workspace,
        creator: user,
        assignee: user
    )
    
    static func exampleFullWorkspace() -> Workspace {
        let owner = User(
            name: "John",
            lastName: "Doe",
            bio: "First user to ever use this app.",
            email: "john.doe@example.com",
            imageData: nil
        )
        
        let member = User(
            name: "Jane",
            lastName: "Smith",
            bio: "Helps organize everyday tasks.",
            email: "jane.smith@example.com",
            imageData: nil
        )
        
        let workspace = Workspace(
            title: "Pet Care",
            bio: "Shared tasks for feeding, walking, shopping, and vet visits.",
            symbolName: "pawprint",
            createdAt: .now,
            isArchived: false
        )
        
        let ownerMembership = WorkspaceMembership(
            workspace: workspace,
            user: owner,
            role: .owner,
            joinedAt: .now
        )
        
        let memberMembership = WorkspaceMembership(
            workspace: workspace,
            user: member,
            role: .member,
            joinedAt: .now
        )
        
        let buyFoodTask = WorkspaceTask(
            title: "Buy dog food",
            bio: "Get dry food before the weekend.",
            createdAt: .now,
            startDate: nil,
            dueDate: Calendar.current.date(byAdding: .day, value: 2, to: .now),
            status: .todo,
            priority: .high,
            workspace: workspace,
            creator: owner,
            assignee: member
        )
        
        let walkDogTask = WorkspaceTask(
            title: "Evening walk",
            bio: "Take Luna for a 30 minute walk.",
            createdAt: .now,
            startDate: .now,
            dueDate: Calendar.current.date(byAdding: .hour, value: 5, to: .now),
            status: .inProgress,
            priority: .medium,
            workspace: workspace,
            creator: member,
            assignee: owner
        )
        
        let vetTask = WorkspaceTask(
            title: "Book vet appointment",
            bio: "Schedule the yearly health check.",
            createdAt: .now,
            startDate: nil,
            dueDate: Calendar.current.date(byAdding: .day, value: 7, to: .now),
            status: .todo,
            priority: .medium,
            workspace: workspace,
            creator: owner,
            assignee: nil
        )
        
        let completedTask = WorkspaceTask(
            title: "Clean food bowls",
            bio: "Wash and dry both bowls.",
            createdAt: .now,
            startDate: nil,
            dueDate: nil,
            status: .done,
            priority: .low,
            workspace: workspace,
            creator: member,
            assignee: member
        )
        
        workspace.memberships = [ownerMembership, memberMembership]
        workspace.tasks = [buyFoodTask, walkDogTask, vetTask, completedTask]
        
        owner.memberships = [ownerMembership]
        owner.createdTasks = [buyFoodTask, vetTask]
        owner.assignedTasks = [walkDogTask]
        
        member.memberships = [memberMembership]
        member.createdTasks = [walkDogTask, completedTask]
        member.assignedTasks = [buyFoodTask, completedTask]
        
        return workspace
    }
    
    static func previewContainer() -> ModelContainer {
        let schema = Schema([
            User.self,
            Workspace.self,
            WorkspaceMembership.self,
            WorkspaceTask.self
        ])

        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )

        let container = try! ModelContainer(
            for: schema,
            configurations: [configuration]
        )
        
        return container
    }
}
