//
//  TaskStatus.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftUI

enum TaskStatus: String, CaseIterable, Codable, Equatable, Hashable, Identifiable {
    case todo
    case inProgress
    case done
    case archived
    
    var id: String { rawValue }
}

extension TaskStatus {
    var title: LocalizedStringKey {
        switch self {
        case .todo: "task.status.todo"
        case .inProgress: "task.status.in_progress"
        case .done: "task.status.done"
        case .archived: "task.status.archived"
        }
    }
}
