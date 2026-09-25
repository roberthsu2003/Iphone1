//
//  CityMapView.swift
//  07_02
//

import MapKit
import SwiftUI

struct CityMapView: View {
    let city: City

    private var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude)
    }

    private var initialPosition: MapCameraPosition {
        .region(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
            )
        )
    }

    var body: some View {
        Map(initialPosition: initialPosition) {
            Annotation(city.city, coordinate: coordinate, anchor: .bottom) {
                CityMapAnnotation(city: city.city, country: city.country)
            }
        }
        .mapControls {
            MapCompass()
            MapScaleView()
        }
        .navigationTitle(city.city)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct CityMapAnnotation: View {
    let city: String
    let country: String

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 2) {
                Text(city)
                    .font(.headline)
                    .fontWeight(.semibold)

                Text(country)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.background, in: RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.15), radius: 4, y: 2)

            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundStyle(.red)
                .offset(y: -3)
        }
    }
}
