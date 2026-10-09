//
//  ContentView.swift
//  0925_1
//
//  Created by roberthsu2003 on 2026/9/25.
//

import SwiftUI

struct WordFlowRootView: View {
    var body: some View {
        ContentUnavailableView(
            "WordFlow",
            systemImage: "text.book.closed",
            description: Text("每日十分鐘，建立你的英文單字量。")
        )
        .accessibilityIdentifier("wordFlowRootView")
    }
}

#Preview {
    WordFlowRootView()
}
