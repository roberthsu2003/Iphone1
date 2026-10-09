//
//  _925_1App.swift
//  0925_1
//
//  Created by roberthsu2003 on 2026/9/25.
//

import SwiftData
import SwiftUI

@main
struct WordFlowApp: App {
    private let modelContainer: ModelContainer?
    private let initializationError: String?

    init() {
        do {
            modelContainer = try WordFlowModelContainer.makePersistent()
            initializationError = nil
        } catch {
            modelContainer = nil
            initializationError = error.localizedDescription
        }
    }

    var body: some Scene {
        WindowGroup {
            if let modelContainer {
                WordFlowRootView()
                    .modelContainer(modelContainer)
            } else {
                ContentUnavailableView(
                    "資料庫無法啟動",
                    systemImage: "externaldrive.badge.exclamationmark",
                    description: Text(initializationError ?? "請重新啟動 App 後再試一次。")
                )
            }
        }
    }
}
