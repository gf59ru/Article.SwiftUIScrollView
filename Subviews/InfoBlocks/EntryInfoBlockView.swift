//
//  EntryInfoBlockView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 06.11.2021.
//

import SwiftUI
import SFSafeSymbols

protocol EntryInfoBlockView: View {

    var titleIcon: SFSymbol { get }

    var title: String { get }

    associatedtype BlockView: View

    var mainBody: Self.BlockView { get }

}

extension EntryInfoBlockView {

    var body: some View {
        VStack(spacing: 0) {
            titleBody
            separator
            mainBody
            hugeSeparator
        }
        .background(Color.white.opacity(0.95))
    }

    private var titleBody: some View {
        HStack {
            Image(systemSymbol: titleIcon)

            Spacer()

            Text(title)
        }
        .font(.system(size: 15))
        .foregroundColor(.brown)
        .shadow(color: .black.opacity(0.5), radius: 2, x: 1, y: 1)
        .padding(8)
    }

    var titleInfo: String? { nil }

}
