//
//  EntryFactsView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 02.11.2021.
//

import SwiftUI
import SFSafeSymbols

struct EntryFactsView: EntryInfoBlockView {

    var titleIcon: SFSymbol { .newspaper }

    var title: String { "Things" }

    @ViewBuilder
    var mainBody: some View {
        let screenWidth = UIScreen.main.bounds.width
        let thirdScreenWidth = screenWidth / 3.5
        VStack {
            buttonFactBody(title: "Lorem ipsum 1",
                           text: "Sed ut perspiciatis",
                           background: .green) {
            }

            buttonFactBody(title: "Lorem ipsum 2",
                           text: "unde omnis iste natus error",
                           background: .blue) {
            }

            separator

            HStack(spacing: 0) {
                Spacer()
                factBody(title: "111", text: "1894")
                    .frame(width: thirdScreenWidth)
                line
                factBody(title: "222", text: "5498")
                    .frame(width: thirdScreenWidth)
                line
                factBody(title: "333", text: "3164")
                    .frame(width: thirdScreenWidth)
                Spacer()
            }
            .foregroundColor(.red)

            HStack(spacing: 0) {
                Spacer()
                factBody(title: "444", text: "64848")
                    .frame(width: thirdScreenWidth)
                line
                factBody(title: "555", text: "198498")
                    .frame(width: thirdScreenWidth)
                line
                factBody(title: "666", text: "6548")
                    .frame(width: thirdScreenWidth)
                Spacer()
            }
            .foregroundColor(.orange)
        }
        .padding([.top, .bottom], 40)
    }

    private func factBody(title: String, text: String) -> some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .default))

            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .padding([.top, .bottom], 12)
        }
    }

    private func buttonFactBody(title: String,
                                text: String,
                                background: Color,
                                action: @escaping () -> Void) -> some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(.gray)

            Button(action: action) {
                Text(text)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .frame(width: 160, height: 45)
                    .background(background.cornerRadius(10))
            }
        }
    }

    private func buttonText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 15))
            .foregroundColor(.gray)
    }

    @ViewBuilder
    private var line: some View {
        Spacer()
        Color.gray
            .frame(width: 2 * UIScreen.main.onePixel, height: 44)
            .cornerRadius(UIScreen.main.onePixel)
        Spacer()
    }

}

struct EntryFacts_Previews: PreviewProvider {
    static var previews: some View {
        EntryFactsView()
    }
}
