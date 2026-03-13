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
    @State private var logText: String = "歡迎來到大富翁！點擊下方擲骰子開始。"
    @State private var diceOne: Int = 1
    @State private var diceTwo: Int = 1
    @State private var isRolling: Bool = false

    private let tiles: [Tile] = Tile.classicTiles

    var body: some View {
        GeometryReader { proxy in
            let safeWidth = proxy.size.width
            let safeHeight = proxy.size.height
            let panelHeight: CGFloat = max(160, safeHeight * 0.28)
            let boardWidth = safeWidth * 0.96
            let boardHeight = max(220, safeHeight - panelHeight - 12)
            let tileWidth = boardWidth / CGFloat(BoardLayout.columns)
            let tileHeight = boardHeight / CGFloat(BoardLayout.rows)
            let centerWidth = tileWidth * CGFloat(BoardLayout.columns - 2)
            let centerHeight = tileHeight * CGFloat(BoardLayout.rows - 2)

            VStack(spacing: 0) {
                TitleBar()

                ZStack {
                    BoardBackground()
                    BoardGrid(tiles: tiles, players: players)
                        .frame(width: boardWidth, height: boardHeight)

                    CenterStage(
                        diceOne: diceOne,
                        diceTwo: diceTwo,
                        isRolling: isRolling,
                        message: logText,
                        players: players
                    )
                    .frame(width: centerWidth, height: centerHeight)
                    .position(x: boardWidth * 0.5, y: boardHeight * 0.5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                ControlPanel(
                    players: players,
                    currentPlayer: players[currentPlayerIndex],
                    lastRoll: lastRoll,
                    canRoll: !players[currentPlayerIndex].isAI && !isRolling,
                    onRoll: { rollDice() }
                )
                .frame(height: panelHeight)
            }
        }
    }

    private func rollDice() {
        if isRolling {
            return
        }

        if players[currentPlayerIndex].skipTurns > 0 {
            players[currentPlayerIndex].skipTurns -= 1
            logText = "\(players[currentPlayerIndex].name) 本回合暫停一次。"
            advanceTurnIfNeeded()
            return
        }

        isRolling = true
        Task {
            let start = Date()
            while Date().timeIntervalSince(start) < 0.8 {
                diceOne = Int.random(in: 1...6)
                diceTwo = Int.random(in: 1...6)
                try? await Task.sleep(nanoseconds: 80_000_000)
            }

            let rollOne = Int.random(in: 1...6)
            let rollTwo = Int.random(in: 1...6)
            diceOne = rollOne
            diceTwo = rollTwo
            lastRoll = rollOne + rollTwo

            await movePlayer(by: lastRoll)
            isRolling = false
        }
    }

    private func movePlayer(by steps: Int) async {
        guard players.indices.contains(currentPlayerIndex) else { return }
        for _ in 0..<steps {
            let nextPosition = (players[currentPlayerIndex].position + 1) % tiles.count
            await MainActor.run {
                withAnimation(.easeInOut(duration: 0.2)) {
                    players[currentPlayerIndex].position = nextPosition
                }
            }
            try? await Task.sleep(nanoseconds: 220_000_000)
        }

        let tile = tiles[players[currentPlayerIndex].position]
        let delta = tile.points
        let tileName = tile.name

        players[currentPlayerIndex].cash += delta
        if tile.effect == .jail {
            players[currentPlayerIndex].skipTurns = 1
        }

        let deltaText = delta == 0 ? "點數不變" : "點數 \(delta > 0 ? "＋" : "－")\(abs(delta))"
        let extra = tile.effect == .jail ? "，坐牢暫停一次" : ""
        logText = "\(players[currentPlayerIndex].name) 擲出 \(steps) 點，停在 \(tileName)，\(deltaText)\(extra)。"

        advanceTurnIfNeeded()
    }

    private func advanceTurnIfNeeded() {
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count

        if players[currentPlayerIndex].isAI {
            Task {
                try? await Task.sleep(nanoseconds: 800_000_000)
                rollDice()
            }
        }
    }
}

private struct BoardBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.94, green: 0.90, blue: 0.78),
                    Color(red: 0.85, green: 0.82, blue: 0.66)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            Rectangle()
                .stroke(Color.black.opacity(0.6), lineWidth: 8)
                .padding(18)
        }
    }
}

private struct BoardGrid: View {
    let tiles: [Tile]
    let players: [Player]

    var body: some View {
        GeometryReader { proxy in
            let tileWidth = proxy.size.width / CGFloat(BoardLayout.columns)
            let tileHeight = proxy.size.height / CGFloat(BoardLayout.rows)
            let tokenSize = min(tileWidth, tileHeight) * 0.45

            ZStack {
                ForEach(tiles.indices, id: \.self) { index in
                    let position = BoardLayout.position(for: index)
                    TileView(tile: tiles[index])
                        .frame(width: tileWidth, height: tileHeight)
                        .position(
                            x: tileWidth * (CGFloat(position.col) + 0.5),
                            y: tileHeight * (CGFloat(position.row) + 0.5)
                        )
                }

                ForEach(players.indices, id: \.self) { index in
                    let position = BoardLayout.position(for: players[index].position)
                    PlayerToken(color: players[index].color)
                        .frame(width: tokenSize, height: tokenSize)
                        .position(
                            x: tileWidth * (CGFloat(position.col) + 0.5) + tokenOffset(for: index, tileWidth: tileWidth, tileHeight: tileHeight).x,
                            y: tileHeight * (CGFloat(position.row) + 0.5) + tokenOffset(for: index, tileWidth: tileWidth, tileHeight: tileHeight).y
                        )
                }
            }
        }
    }

    private func tokenOffset(for index: Int, tileWidth: CGFloat, tileHeight: CGFloat) -> CGPoint {
        let offset = min(tileWidth, tileHeight) * 0.18
        if index == 0 {
            return CGPoint(x: -offset, y: -offset)
        }
        return CGPoint(x: offset, y: offset)
    }
}

private struct TileView: View {
    let tile: Tile

    var body: some View {
        ZStack {
            Rectangle()
                .fill(tile.color)
                .overlay(
                    Rectangle().stroke(Color.black.opacity(0.6), lineWidth: 1)
                )

            VStack(spacing: 4) {
                Image(systemName: tile.iconName)
                    .font(.system(size: 16, weight: .bold))
                Text(tile.label)
                    .font(.system(size: 13, weight: .bold))
                    .multilineTextAlignment(.center)
                Text(tile.pointsText)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(tile.pointsTextColor)
            }
            .foregroundColor(.black)
            .padding(6)
        }
    }
}

private struct PlayerToken: View {
    let color: Color

    var body: some View {
        Circle()
            .fill(color)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
    }
}

private struct TitleBar: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("MONOPOLY")
                    .font(.system(size: 22, weight: .heavy))
            }

            Spacer()
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 8)
    }
}

private struct DiceOverlay: View {
    let diceOne: Int
    let diceTwo: Int
    let isRolling: Bool

    var body: some View {
        HStack(spacing: 12) {
            DiceFace(value: diceOne)
            DiceFace(value: diceTwo)
        }
        .padding(10)
        .background(Color.white.opacity(0.9))
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
        .opacity(isRolling ? 1 : 0)
        .scaleEffect(isRolling ? 1.0 : 0.9)
        .animation(.easeInOut(duration: 0.2), value: isRolling)
    }
}

private struct CenterStage: View {
    let diceOne: Int
    let diceTwo: Int
    let isRolling: Bool
    let message: String
    let players: [Player]

    var body: some View {
        VStack(spacing: 12) {
            DiceOverlay(
                diceOne: diceOne,
                diceTwo: diceTwo,
                isRolling: isRolling
            )

            MessageOverlay(text: message)

            Spacer(minLength: 0)

            PlayerStatusRow(players: players)
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white.opacity(0.55))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.12), lineWidth: 1)
        )
    }
}

private struct MessageOverlay: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.9))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
            .frame(maxWidth: .infinity)
    }
}

private struct DiceFace: View {
    let value: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.6), lineWidth: 1)
                )

            Text("\(value)")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(width: 52, height: 52)
    }
}

private struct ControlPanel: View {
    let players: [Player]
    let currentPlayer: Player
    let lastRoll: Int
    let canRoll: Bool
    let onRoll: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("目前回合")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.secondary)
                    Text(currentPlayer.name)
                        .font(.system(size: 18, weight: .bold))
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("最近骰點")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.secondary)
                    Text(lastRoll == 0 ? "-" : "\(lastRoll)")
                        .font(.system(size: 18, weight: .bold))
                }
            }

            Button(action: onRoll) {
                Text("擲骰子")
                    .font(.system(size: 16, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!canRoll)
        }
        .padding(16)
        .background(
            LinearGradient(
                colors: [Color.white, Color(red: 0.96, green: 0.93, blue: 0.86)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .overlay(
            Rectangle()
                .stroke(Color.black.opacity(0.08), lineWidth: 1)
        )
    }
}

private struct PlayerStatusRow: View {
    let players: [Player]

    var body: some View {
        HStack(spacing: 12) {
            ForEach(players.indices, id: \.self) { index in
                let player = players[index]
                HStack(spacing: 8) {
                    Circle()
                        .fill(player.color)
                        .frame(width: 12, height: 12)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(player.name)
                            .font(.system(size: 12, weight: .semibold))
                        Text("現金 \(player.cash)")
                            .font(.system(size: 12, weight: .bold))
                    }
                }
                .padding(8)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct Player {
    let name: String
    var position: Int
    var cash: Int
    var skipTurns: Int
    let color: Color
    let isAI: Bool
}

private struct Tile {
    let name: String
    let label: String
    let iconName: String
    let points: Int
    let effect: TileEffect
    let color: Color

    var pointsText: String {
        if effect == .jail {
            return "坐牢"
        }
        if points == 0 {
            return "±0"
        }
        return points > 0 ? "+\(points)" : "\(points)"
    }

    var pointsTextColor: Color {
        if effect == .jail {
            return .black
        }
        return points >= 0 ? Color(red: 0.12, green: 0.45, blue: 0.18) : Color(red: 0.62, green: 0.14, blue: 0.14)
    }

    static let classicTiles: [Tile] = [
        Tile(name: "起點", label: "GO", iconName: "play.fill", points: 200, effect: .points, color: Color(red: 0.88, green: 0.70, blue: 0.42)),
        Tile(name: "棕色地段", label: "棕地", iconName: "house.fill", points: -60, effect: .points, color: Color(red: 0.86, green: 0.76, blue: 0.63)),
        Tile(name: "機會", label: "機會", iconName: "sparkles", points: 120, effect: .points, color: Color(red: 0.92, green: 0.82, blue: 0.55)),
        Tile(name: "棕色地段", label: "棕地", iconName: "house.fill", points: -80, effect: .points, color: Color(red: 0.86, green: 0.76, blue: 0.63)),
        Tile(name: "所得稅", label: "稅", iconName: "dollarsign.circle", points: -150, effect: .points, color: Color(red: 0.92, green: 0.85, blue: 0.75)),
        Tile(name: "鐵路", label: "鐵路", iconName: "tram.fill", points: -100, effect: .points, color: Color(red: 0.75, green: 0.75, blue: 0.75)),
        Tile(name: "監獄 / 來訪", label: "監獄", iconName: "lock.fill", points: 0, effect: .jail, color: Color(red: 0.80, green: 0.70, blue: 0.60)),
        Tile(name: "淡藍地段", label: "淡藍", iconName: "house.fill", points: -90, effect: .points, color: Color(red: 0.70, green: 0.82, blue: 0.86)),
        Tile(name: "公益金", label: "公益", iconName: "gift.fill", points: 100, effect: .points, color: Color(red: 0.90, green: 0.90, blue: 0.90)),
        Tile(name: "淡藍地段", label: "淡藍", iconName: "house.fill", points: -110, effect: .points, color: Color(red: 0.70, green: 0.82, blue: 0.86)),
        Tile(name: "免費停車", label: "停車", iconName: "parkingsign.circle", points: 50, effect: .points, color: Color(red: 0.88, green: 0.70, blue: 0.42)),
        Tile(name: "粉紅地段", label: "粉紅", iconName: "house.fill", points: -120, effect: .points, color: Color(red: 0.88, green: 0.60, blue: 0.60)),
        Tile(name: "電力公司", label: "電力", iconName: "bolt.fill", points: -140, effect: .points, color: Color(red: 0.85, green: 0.85, blue: 0.85)),
        Tile(name: "入獄", label: "入獄", iconName: "exclamationmark.shield.fill", points: 0, effect: .jail, color: Color(red: 0.80, green: 0.70, blue: 0.60)),
        Tile(name: "橘色地段", label: "橘地", iconName: "house.fill", points: -130, effect: .points, color: Color(red: 0.95, green: 0.77, blue: 0.56)),
        Tile(name: "董事會大道", label: "董事會", iconName: "crown.fill", points: 180, effect: .points, color: Color(red: 0.70, green: 0.74, blue: 0.86))
    ]
}

private enum TileEffect {
    case points
    case jail
}

private enum BoardLayout {
    static let columns: Int = 4
    static let rows: Int = 6

    static func position(for index: Int) -> (row: Int, col: Int) {
        if index <= 3 {
            return (row: rows - 1, col: (columns - 1) - index)
        } else if index <= 7 {
            return (row: (rows - 2) - (index - 4), col: 0)
        } else if index <= 11 {
            return (row: 0, col: index - 8)
        } else {
            return (row: 1 + (index - 12), col: columns - 1)
        }
    }
}

#Preview {
    ContentView()
}
