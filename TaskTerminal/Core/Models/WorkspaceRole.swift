//
//  WorkspaceRole.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation
import SwiftUI

enum WorkspaceRole: String, CaseIterable, Codable, Equatable, Hashable, Identifiable {
    case owner
    case member
    
    var id: String { rawValue }
}

extension WorkspaceRole {
    var title: LocalizedStringKey {
        switch self {
        case .owner: return "workspace.role.owner"
        case .member: return "workspace.role.member"        
        }
    }
}
