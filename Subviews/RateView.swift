//
//  RateView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 26.10.2021.
//

import SwiftUI
import SFSafeSymbols

struct RateView: View {

    static let starWidth = CGFloat(34)
    static let starHalfWidth = starWidth / CGFloat(2)
    static let viewPadding = CGFloat(32)

    @Binding private var rate: Decimal?
    private var swipeEnabled: Bool

    init(rate: Binding<Decimal?>, swipeEnabled: Bool) {
        _rate = rate
        self.swipeEnabled = swipeEnabled
    }

    @ViewBuilder
    var body: some View {
        GeometryReader { proxy in
            let starPadding = (proxy.size.width - 5 * Self.starWidth) / 10
            let width = proxy.size.width - starPadding * 2 - Self.starWidth
            let firstStarOffset: CGFloat = starPadding + Self.starWidth / 2
            if swipeEnabled {
                starsBody(starPadding: starPadding)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ dragValue in
                        processGesture(x: dragValue.location.x - firstStarOffset, width: width)
                    })
                                .onEnded({ dragValue in
                        processGesture(x: dragValue.location.x - firstStarOffset, width: width)
                    }))
            } else {
                starsBody(starPadding: starPadding)
            }
        }
        .frame(height: 64)
        .padding([.leading, .trailing], Self.viewPadding)
        .background(Color.white)
    }

    private func starsBody(starPadding: CGFloat) -> some View {
            HStack(spacing: 0) {
                star(compareWith: 1, starPadding: starPadding)
                star(compareWith: 2, starPadding: starPadding)
                star(compareWith: 3, starPadding: starPadding)
                star(compareWith: 4, starPadding: starPadding)
                star(compareWith: 5, starPadding: starPadding)
            }
            .frame(height: 64)
    }

    private func star(compareWith rate: Decimal, starPadding: CGFloat) -> some View {
        Image(systemSymbol: self.rate ?? 0 >= rate ? .starFill : .star)
            .foregroundColor(.orange)
            .frame(width: Self.starWidth, height: Self.starWidth)
            .padding([.leading, .trailing], starPadding)

    }

    private func processGesture(x: CGFloat, width: CGFloat) {
        var rate = Decimal(x / width * 4.0 + 1.0)
        if rate < 1 { rate = 1 }
        if rate > 5 { rate = 5 }
        self.rate = rate
    }

}

struct RateView_Previews: PreviewProvider {

    @State private static var rate: Decimal? = 3.5

    static var previews: some View {
        RateView(rate: $rate, swipeEnabled: true)
    }

}
