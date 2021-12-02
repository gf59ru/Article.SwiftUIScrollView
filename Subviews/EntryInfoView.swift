//
//  EntryInfoView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 30.10.2021.
//

import SwiftUI

import SDWebImageSwiftUI
import SFSafeSymbols

struct EntryInfoView: View {

    private var imageOffset: CGFloat

    init(imageOffset: CGFloat) {
        self.imageOffset = imageOffset
    }

    @ViewBuilder
    var body: some View {
        let screenBounds = UIScreen.main.bounds

        ZStack(alignment: .topLeading) {
            HStack {
                infoBody

                cardsBody
                    .frame(height: screenBounds.height / 4)
                    .padding(8)
            }
            .padding(16)
        }
        .offset(y: imageOffset)
    }

    @ViewBuilder
    private var infoBody: some View {
        let screenBounds = UIScreen.main.bounds
        let rating = Decimal(4.2)

        VStack(spacing: 0) {
            Text(rating.ratingString)
                .font(.system(size: 24))
                .padding(.top, 8)

            Text("49,849")
                .font(.system(size: 10))
                .padding(.top, 4)

            EntryLittleStarsView(rating: rating)
                .foregroundColor(.orange)
                .padding(4)
        }
        .frame(minHeight: screenBounds.width / 3)
        .background(Color.white)
        .cornerRadius(8)
    }

    private var cardsBody: some View {
        GeometryReader { proxy in
            let size = CGSize(width: proxy.size.width - 48,
                              height: proxy.size.height - 48)
            let imageSize = CGSize(width: proxy.size.width - 64,
                                   height: proxy.size.height - 64)
            ZStack {
                cardBody(size: size, color: .red) {
                    ZStack {
                        Color.white

                        AnimatedImage(url: URL(string: "https://images.pexels.com/photos/10136037/pexels-photo-10136037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))
                            .resizable()
                            .blur(radius: 2)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageSize.width, height: imageSize.height)
                            .clipped()
                            .cornerRadius(12)
                    }
                }
                .offset(y: 48)

                cardBody(size: size, color: .green) {
                    ZStack {
                        Color.white

                        AnimatedImage(url: URL(string: "https://images.pexels.com/photos/10243803/pexels-photo-10243803.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))
                            .resizable()
                            .blur(radius: 2)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageSize.width, height: imageSize.height)
                            .clipped()
                            .cornerRadius(12)
                    }
                }
                .offset(x: 24, y: 24)

                cardBody(size: size, color: .blue) {
                    ZStack {
                        Color.white

                        AnimatedImage(url: URL(string: "https://images.pexels.com/photos/10278313/pexels-photo-10278313.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageSize.width, height: imageSize.height)
                            .clipped()
                            .cornerRadius(12)
                    }
                }
                .offset(x: 48)
            }
        }
    }

    private func cardBody<Content: View>(size: CGSize, color: Color, @ViewBuilder content: () -> Content) -> some View {
        ZStack {
            color
                .opacity(0.75)
                .frame(width: size.width, height: size.height)
                .cornerRadius(16)
            content()
                .frame(width: size.width - 8,
                       height: size.height - 8)
                .cornerRadius(14)
        }
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }

    private var priceBody: some View {
        VStack {
            ZStack {
                Image(systemSymbol: .circleSquare)
                HStack(alignment: .top, spacing: 0) {
                    Text("$")
                        .font(.system(size: 9))
                    Text("497")
                        .font(.system(size: 20))
                }
            }
            HStack(spacing: 0) {
                Image(systemSymbol: .plusMessage)
                Text("Average price")
            }
            .font(.system(size: 10))
            .opacity(0.25)
        }
    }

}

struct EntryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            EntryInfoView(imageOffset: 0)
        }
    }
}
