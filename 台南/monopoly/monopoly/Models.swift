//
//  Models.swift
//  monopoly
//
//  Created by roberthsu2003 on 2026/3/13.
//

import SwiftUI

// MARK: - BoardLayout

enum BoardLayout {
    static let columns = 6
    static let rows = 6
    static let totalTiles = 20
}

// MARK: - TileType

enum TileType {
    case corner
    case property
    case chance
    case tax
    case railroad
    case utility
}

// MARK: - Tile

struct Tile: Identifiable {
    let id: Int
    let name: String
    let type: TileType
    let color: Color?
    let price: Int?

    init(id: Int, name: String, type: TileType, color: Color? = nil, price: Int? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.color = color
        self.price = price
    }

    static let classicTiles: [Tile] = [
        Tile(id: 0, name: "起點", type: .corner),
        Tile(id: 1, name: "淡江路", type: .property, color: .brown, price: 60),
        Tile(id: 2, name: "命運", type: .chance),
        Tile(id: 3, name: "建國路", type: .property, color: .brown, price: 60),
        Tile(id: 4, name: "所得稅", type: .tax),
        Tile(id: 5, name: "台南火車站", type: .railroad, price: 200),
        Tile(id: 6, name: "民生路", type: .property, color: .cyan, price: 100),
        Tile(id: 7, name: "機會", type: .chance),
        Tile(id: 8, name: "中正路", type: .property, color: .cyan, price: 100),
        Tile(id: 9, name: "監獄", type: .corner),
        Tile(id: 10, name: "民族路", type: .property, color: .pink, price: 140),
        Tile(id: 11, name: "成功路", type: .property, color: .pink, price: 140),
        Tile(id: 12, name: "台南車站", type: .railroad, price: 200),
        Tile(id: 13, name: "大學路", type: .property, color: .orange, price: 180),
        Tile(id: 14, name: "免費停車", type: .corner),
        Tile(id: 15, name: "公園南路", type: .property, color: .red, price: 220),
        Tile(id: 16, name: "中華西路", type: .property, color: .red, price: 220),
        Tile(id: 17, name: "安平車站", type: .railroad, price: 200),
        Tile(id: 18, name: "西門路", type: .property, color: .green, price: 300),
        Tile(id: 19, name: "入獄", type: .corner)
    ]
}

// MARK: - Player

struct Player: Identifiable {
    let id = UUID()
    let name: String
    var position: Int
    var cash: Int
    var skipTurns: Int
    let color: Color
    let isAI: Bool
}
