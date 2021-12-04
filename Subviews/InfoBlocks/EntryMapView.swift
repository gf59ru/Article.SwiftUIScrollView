//
//  EntryMapView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 06.11.2021.
//

import SwiftUI
import MapKit

import SFSafeSymbols

struct EntryMapView: EntryInfoBlockView {

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.447383, longitude: 30.5089365), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var title: String { "Map" }

    var titleIcon: SFSymbol { .map }

    @ViewBuilder
    var mainBody: some View {
        Text("Lorem ipsum")
            .font(.system(size: 24))
            .padding(12)
        ratingsBody
        mapBody
            .padding(16)
    }

    private var ratingsBody: some View {
        HStack(spacing: 12) {
            Text("8 items")
                .font(.system(size: 14))
                .foregroundColor(Color.blue)

            Spacer()

            HStack {
                Image(systemSymbol: .starFill)
                    .foregroundColor(.orange)
                    .padding(.leading, 9)
                Text("4.0")
                    .font(.system(size: 14))
                    .foregroundColor(.orange)
                    .padding(.trailing, 9)
            }
            .frame(height: 23)
            .background(Color.gray.opacity(0.25))
            .cornerRadius(10)

            Spacer()

            Text("5545 ratings")
                .font(.system(size: 14))
                .foregroundColor(.green)
        }
        .padding([.leading, .trailing], 16)
    }

    private var mapBody: some View {
        Map(coordinateRegion: $region)
            .frame(height: 130)
            .cornerRadius(16)
    }

}

struct EntryMapView_Previews: PreviewProvider {
    static var previews: some View {
        EntryMapView()
    }
}
