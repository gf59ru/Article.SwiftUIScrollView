//
//  EntryLatestCommentsView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 06.11.2021.
//

import SwiftUI
import SFSafeSymbols

struct ReviewItem {
    let id = UUID()

    let avatar: UIImage?
    let username: String
    let review: String
    let rating: Decimal

    let media: Image
    let color: Color
}

struct EntryLatestCommentsView: EntryInfoBlockView {

    var title: String { "Latest comments" }

    var titleIcon: SFSymbol { .textQuote }

    private let reviews: [ReviewItem] = [
        ReviewItem(avatar: nil,
                   username: "Username",
                   review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                   rating: 2.3,
                   media: Image(systemSymbol: .noteText),
                   color: .blue),
        ReviewItem(avatar: nil,
                   username: "Username",
                   review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                   rating: 3.4,
                   media: Image(systemSymbol: .noteTextBadgePlus),
                   color: .green),
        ReviewItem(avatar: nil,
                   username: "Username",
                   review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                   rating: 4.5,
                   media: Image(systemSymbol: .textBubble),
                   color: .red)
    ]

    @ViewBuilder
    var mainBody: some View {
        ForEach(reviews, id: \.id) { review in
            reviewBody(review)
                .frame(height: 90)
                .padding([.top, .bottom], 8)
                .padding([.leading, .trailing], 16)
            separator
        }
    }

    private func reviewBody(_ review: ReviewItem) -> some View {
        HStack {
            mediaBody(review)
            VStack(alignment: .leading) {
                HStack {
                    avatarBody(review)
                    Text(review.username)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }

                Text(review.review)
                    .font(.system(size: 10))
                    .lineLimit(2)

                Spacer()

                ratingAndTastesBody(review)
            }
            .frame(height: 73)
        }
    }

    private func mediaBody(_ review: ReviewItem) -> some View {
        ZStack {
            review.media
                .font(.system(size: 45))
                .foregroundColor(review.color)
                .shadow(color: review.color.opacity(0.5),
                        radius: 2, x: 1, y: 1)
                .frame(width: 70, height: 70)
                .cornerRadius(4)
                .padding(3)
        }
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
    }

    @ViewBuilder
    private func avatarBody(_ review: ReviewItem) -> some View {
        if let avatar = review.avatar {
            Image(uiImage: avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .cornerRadius(10)
        } else {
            Image(systemSymbol: .photo)
                .font(.system(size: 19))
                .foregroundColor(.gray)
        }
    }

    private func ratingAndTastesBody(_ review: ReviewItem) -> some View {
        HStack(spacing: 25) {
            HStack(spacing: 1) {
                Image(systemSymbol: .starFill)
                    .font(.system(size: 13))
                    .foregroundColor(.orange)
                Text(review.rating.ratingString)
                    .font(.system(size: 13))
            }

            HStack(spacing: 3) {
                Image(systemSymbol: .circle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)

                Image(systemSymbol: .circleFill)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
            }
            .foregroundColor(review.color)

            HStack(spacing: 3) {
                Image(systemSymbol: .square)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)

                Image(systemSymbol: .squareFill)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
            }
            .foregroundColor(review.color)
        }
    }

}

struct EntryLatestCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        EntryLatestCommentsView()
    }
}
