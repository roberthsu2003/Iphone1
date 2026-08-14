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
    /*
    init(){
        cities.forEach{
            city in
            print(city.city)
        }
    }
     */
    var body: some View {
        NavigationStack {
            List(cities) { city in
                VStack(alignment: .leading, spacing: 8) {
                    Text(city.city)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text("\(city.country) · \(city.continent)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text(city.local)
                        .font(.body)
                        .lineLimit(3)
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("城市列表")
        }
        
    }
}

#Preview {
    MainView()
}
