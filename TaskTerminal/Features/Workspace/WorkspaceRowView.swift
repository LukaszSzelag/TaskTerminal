//
//  WorkspaceRowView.swift
//  TaskTerminal
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import SwiftUI
import SwiftData

struct WorkspaceRowView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let container = SampleData.previewContainer()
    WorkspaceRowView()
        .modelContainer(container)
}
