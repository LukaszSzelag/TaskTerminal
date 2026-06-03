//
//  TaskPriority.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftUI

enum TaskPriority: String, CaseIterable, Codable, Equatable, Hashable, Identifiable {
    case low
    case medium
    case high
    
    var id: String { rawValue }
}

extension TaskPriority {
    var title: LocalizedStringKey {
        switch self {
        case .low: return "task.priority.low"
        case .medium: return "task.priority.medium"
        case .high: return "task.priority.high"
        }
    }
}
