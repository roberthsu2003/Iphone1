//
//  ContentView.swift
//  monopoly
//
//  Created by roberthsu2003 on 2026/3/13.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "玩家 1", position: 0, cash: 1500, skipTurns: 0, color: .red, isAI: false),
        Player(name: "玩家 2 (AI)", position: 0, cash: 1500, skipTurns: 0, color: .blue, isAI: true)
    ]
    @State private var currentPlayerIndex: Int = 0
    @State private var lastRoll: Int = 0
    @State private var logText: String = "歡迎點擊擲骰子開始。"
    @State private var diceOne: Int = 1
    @State private var diceTwo: Int = 1
    @State private var isRolling: Bool = false

    private let tiles: [Tile] = Tile.classicTiles

    var body: some View {
        GeometryReader { proxy in
            let safeWidth = proxy.size.width
            let safeHeight = proxy.size.height
            let isCompactHeight = safeHeight < 500
            let panelHeight: CGFloat = isCompactHeight ? 132 : max(220, safeHeight * 0.28)
            let boardWidth = safeWidth * 0.96
            let boardHeight = max(220, safeHeight - panelHeight - 12)
            let tileSize = min(boardWidth, boardHeight) / CGFloat(BoardLayout.columns)

            VStack(spacing: 8) {
                boardView(tileSize: tileSize)
                    .frame(width: tileSize * CGFloat(BoardLayout.columns),
                           height: tileSize * CGFloat(BoardLayout.rows))

                controlPanel(compact: isCompactHeight)
                    .frame(height: panelHeight)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
    }

    // MARK: - Board

    private func boardView(tileSize: CGFloat) -> some View {
        let positions = tilePositions(tileSize: tileSize)
        return ZStack {
            Color.white
            ForEach(0..<tiles.count, id: \.self) { index in
                tileView(tile: tiles[index], size: tileSize)
                    .position(positions[index])
            }
            ForEach(Array(players.enumerated()), id: \.element.id) { pIndex, player in
                tokenView(color: player.color, size: tileSize * 0.35)
                    .position(tokenPosition(for: player, tileSize: tileSize, positions: positions))
            }
        }
    }

    private func tileView(tile: Tile, size: CGFloat) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                .background(Color.white)

            if let color = tile.color {
                Rectangle()
                    .fill(color.opacity(0.7))
                    .frame(width: size, height: size * 0.28)
                    .offset(y: -size * 0.36)
            }

            VStack(spacing: 2) {
                Text(tile.name)
                    .font(.system(size: max(7, size * 0.13), weight: .medium))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                if let price = tile.price {
                    Text("$\(price)")
                        .font(.system(size: max(6, size * 0.1)))
                        .foregroundColor(.gray)
                }
            }
            .padding(2)
        }
        .frame(width: size, height: size)
    }

    private func tokenView(color: Color, size: CGFloat) -> some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .overlay(Circle().stroke(Color.white, lineWidth: 1))
    }

    // MARK: - Layout

    private func tilePositions(tileSize: CGFloat) -> [CGPoint] {
        let cols = BoardLayout.columns
        let rows = BoardLayout.rows
        let half = tileSize / 2
        var pts: [CGPoint] = []

        for row in 0..<rows {
            for col in 0..<cols {
                let isEdge = row == 0 || row == rows - 1 || col == 0 || col == cols - 1
                if isEdge {
                    pts.append(CGPoint(x: half + CGFloat(col) * tileSize,
                                       y: half + CGFloat(row) * tileSize))
                }
            }
        }
        return pts
    }

    private func tokenPosition(for player: Player, tileSize: CGFloat, positions: [CGPoint]) -> CGPoint {
        let idx = player.position % positions.count
        let base = positions[idx]
        let offset: CGFloat = player.isAI ? tileSize * 0.18 : -tileSize * 0.18
        return CGPoint(x: base.x + offset, y: base.y + offset)
    }

    // MARK: - Controls

    private func controlPanel(compact: Bool) -> some View {
        Group {
            if compact {
                HStack(spacing: 12) {
                    diceStack
                    statusText
                        .frame(maxWidth: .infinity, minHeight: 44)
                    playerSummary
                    rollButton
                }
            } else {
                VStack(spacing: 10) {
                    diceStack
                    statusText
                    playerSummary
                    rollButton
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .padding(.horizontal)
    }

    private var diceStack: some View {
        HStack(spacing: 16) {
            diceFace(value: diceOne, size: 48)
            diceFace(value: diceTwo, size: 48)
        }
    }

    private var statusText: some View {
        Text(logText)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .fixedSize(horizontal: true, vertical: true)
            .padding(.horizontal)
            .padding(.horizontal)
    }

    private var playerSummary: some View {
        HStack(spacing: 24) {
            ForEach(Array(players.enumerated()), id: \.element.id) { index, player in
                VStack(spacing: 4) {
                    HStack(spacing: 6) {
                        Circle().fill(player.color).frame(width: 12, height: 12)
                        Text(player.name)
                            .font(.caption.bold())
                    }
                    Text("$\(player.cash)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(index == currentPlayerIndex ? Color.accentColor.opacity(0.15) : Color.clear)
                )
            }
        }
    }

    private var rollButton: some View {
        Button(action: rollDice) {
            Text(isRolling ? "擲骰中..." : "擲骰子")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: 200)
                .padding(.vertical, 10)
                .background(isRolling ? Color.gray : Color.accentColor)
                .cornerRadius(10)
        }
        .disabled(isRolling)
    }

    private func diceFace(value: Int, size: CGFloat) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: size, height: size)
                .shadow(radius: 2)
            Text("\(value)")
                .font(.system(size: size * 0.5, weight: .bold, design: .rounded))
        }
    }

    // MARK: - Game Logic

    private func rollDice() {
        guard !isRolling else { return }

        var player = players[currentPlayerIndex]
        if player.skipTurns > 0 {
            player.skipTurns -= 1
            players[currentPlayerIndex] = player
            logText = "\(player.name) 跳過本回合。"
            nextTurn()
            return
        }

        isRolling = true
        logText = "\(player.name) 擲骰子中..."

        var count = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { t in
            diceOne = Int.random(in: 1...6)
            diceTwo = Int.random(in: 1...6)
            count += 1
            if count >= 10 {
                t.invalidate()
                let total = diceOne + diceTwo
                lastRoll = total
                player.position = (player.position + total) % BoardLayout.totalTiles
                handleLanding(&player)
                players[currentPlayerIndex] = player
                logText = "\(player.name) 擲出了 \(total)（\(diceOne)+\(diceTwo)），目前在「\(tiles[player.position].name)」"
                isRolling = false
                nextTurn()
            }
        }
        _ = timer
    }

    private func handleLanding(_ player: inout Player) {
        let tile = tiles[player.position]
        switch tile.type {
        case .tax:
            let tax = 200
            player.cash = max(0, player.cash - tax)
            logText += "\n繳稅 $\(tax)。"
        case .corner where tile.name == "入獄":
            player.skipTurns = 3
            logText += "\n進監獄！跳過3回合。"
        default:
            break
        }
    }

    private func nextTurn() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
    }
}

#Preview {
    ContentView()
}
