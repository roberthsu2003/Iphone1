//
//  ContentView.swift
//  07_02
//
//  Created by roberthsu2003 on 2026/7/2.
//

import SwiftUI

struct City: Decodable, Identifiable {
    let city: String
    let continent: String
    let country: String
    let image: String
    let local: String
    let latitude: Double
    let longitude: Double
    let url: String

    var id: String {
        "\(city)-\(country)"
    }

    enum CodingKeys: String, CodingKey {
        case city = "City"
        case continent = "Continent"
        case country = "Country"
        case image = "Image"
        case local = "Local"
        case latitude = "lat"
        case longitude = "long"
        case url
    }
}

struct CityDataLoader {
    static func loadCities() -> [City] {
        guard let url = Bundle.main.url(forResource: "citylist", withExtension: "plist") else {
            return []
        }
        //print(url)
        do {
            let data = try Data(contentsOf: url)
            return try PropertyListDecoder().decode([City].self, from: data)
        } catch {
            return []
        }
    }
}

struct MainView: View {
    private let cities = CityDataLoader.loadCities()

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }

    var body: some View {
        NavigationStack {
            List(cities) { city in
                NavigationLink {
                    CityDetailView(city: city)
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(city.city)
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text("\(city.country) · \(city.continent)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("城市")
            .tint(.blue)
        }
        
    }
}

struct CityDetailView: View {
    let city: City

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(city.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 8) {
                    Text(city.city)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("\(city.country) · \(city.continent)")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    DetailRow(title: "國家", value: city.country)
                    DetailRow(title: "洲", value: city.continent)
                    DetailRow(title: "緯度", value: "\(city.latitude)")
                    DetailRow(title: "經度", value: "\(city.longitude)")
                    DetailRow(title: "網址", value: city.url)
                    DetailRow(title: "圖片", value: city.image)
                }

                Text(city.local)
                    .font(.body)
                    .lineSpacing(4)
            }
            .padding()
        }
        .navigationTitle(city.city)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.body)
        }
    }
}

#Preview {
    MainView()
}
