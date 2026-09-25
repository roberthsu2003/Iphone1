//
//  CityDetailView.swift
//  07_02
//

import SwiftUI

struct CityDetailView: View {
    let city: City

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(city.image.replacingOccurrences(of: ".jpg", with: ""))
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .firstTextBaseline, spacing: 12) {
                        Text(city.city)
                            .font(.title)
                            .fontWeight(.medium)

                        Spacer(minLength: 0)

                        Text("國家：\(city.country)，洲：\(city.continent)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.trailing)
                    }

                }

                Divider()

                Text(city.local)
                    .font(.body)
                    .lineSpacing(4)
            }
            .padding()
        }
        .navigationTitle(city.city)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                if let websiteURL = URL(string: city.url) {
                    Link(destination: websiteURL) {
                        Label("開啟網頁", systemImage: "safari")
                    }
                }

                NavigationLink {
                    CityMapView(city: city)
                } label: {
                    Label("在地圖中開啟", systemImage: "map")
                }
            }
        }
    }
}


