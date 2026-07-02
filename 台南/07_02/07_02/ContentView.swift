//
//  ContentView.swift
//  07_02
//
//  Created by roberthsu2003 on 2026/7/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("這是我第一個swiftUI").font(.system(size:36, weight: .bold))
                .padding(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
