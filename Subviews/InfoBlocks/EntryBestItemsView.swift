//
//  EntryBestItemsView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 06.11.2021.
//

import SwiftUI
import SFSafeSymbols

struct BestItem {
    let id = UUID()
    let title1: String
    let title2: String
    let year: Int
    let title3: String

    let flag: Image
    let rating: Decimal
    let votesCount: Int
    let price: Int

    let image: Image
    let color: Color
}

struct EntryBestItemsView: EntryInfoBlockView {

    var title: String { "Best of the best" }

    var titleIcon: SFSymbol { .starCircle }

    private let bestItems: [BestItem] = [
        BestItem(title1: "Lorem",
                 title2: "ipsum",
                 year: 1981,
                 title3: "dolor sit amet",
                 flag: Image(systemSymbol: .flagCircleFill),
                 rating: 2.3,
                 votesCount: 2237,
                 price: 397,
                 image: Image(systemSymbol: .cart),
                 color: .purple),
        BestItem(title1: "Lorem",
                 title2: "ipsum",
                 year: 2117,
                 title3: "consectetur adipiscing elit",
                 flag: Image(systemSymbol: .flagSlashFill),
                 rating: 3.4,
                 votesCount: 2237,
                 price: 397,
                 image: Image(systemSymbol: .tray),
                 color: .pink),
        BestItem(title1: "Lorem",
                 title2: "ipsum",
                 year: 3481,
                 title3: "sed do eiusmod tempor",
                 flag: Image(systemSymbol: .flagBadgeEllipsisFill),
                 rating: 4.5,
                 votesCount: 2237,
                 price: 397,
                 image: Image(systemSymbol: .book),
                 color: .orange)
    ]

    var mainBody: some View {
        VStack(spacing: 0) {
            ForEach(bestItems, id: \.id) { item in
                itemBody(item)
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.bottom, 16)
                    .shadow(color: .white,
                            radius: 8, x: 2, y: 4)
            }
        }
        .padding([.top, .leading, .trailing], 16)
        .background(Color.gray.opacity(0.5))
    }

    private func itemBody(_ item: BestItem) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title1)
                    .font(.system(size: 13))
                    .opacity(0.5)

                HStack {
                    Text(item.title2)
                    Text("\(item.year)")
                        .foregroundColor(item.color)
                }
                .font(.system(size: 15))

                HStack(spacing: 0) {
                    item.flag
                        .font(.system(size: 12))
                        .foregroundColor(item.color)
                        .padding(2)
                    Text(item.title3)
                        .font(.system(size: 13))
                        .opacity(0.5)
                }

                ratingAndPriceBody(item)
            }

            Spacer()

            item.image
                .font(.system(size: 50))
                .foregroundColor(item.color)
                .shadow(color: item.color.opacity(0.5),
                        radius: 2, x: 1, y: 1)
        }
        .padding(16)
    }

    private func ratingAndPriceBody(_ item: BestItem) -> some View {
        HStack(spacing: 2) {
            Text(item.rating.ratingString)
                .font(.system(size: 14))

            VStack(spacing: 0) {
                EntryLittleStarsView(rating: item.rating, starSize: CGSize(width: 7, height: 6))
                    .foregroundColor(.orange)
                Text("\(item.votesCount)")
                    .font(.system(size: 7))
                    .opacity(0.5)
            }
            HStack(spacing: 0) {
                Image(systemSymbol: .dollarsignCircle)
                    .font(.system(size: 15))
                    .foregroundColor(.green)
                    .shadow(color: .black.opacity(0.5), radius: 1, x: 1, y: 1)
                HStack(alignment: .top, spacing: 0) {
                    Text("\(item.price)")
                        .font(.system(size: 13))
                }
            }
        }
    }

}

struct EntryBestItemsView_Previews: PreviewProvider {
    static var previews: some View {
        EntryBestItemsView()
    }
}
