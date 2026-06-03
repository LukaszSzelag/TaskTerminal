//
//  TaskTerminalApp.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 01/06/2026.
//

import SwiftUI
import SwiftData

@main
struct TaskTerminalApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(
            for: [
                User.self,
                Workspace.self,
                WorkspaceMembership.self,
                WorkspaceTask.self
            ]
        )
    }
}
