//
//  EntryLittleStarsView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 06.11.2021.
//

import SwiftUI
import SFSafeSymbols

struct EntryLittleStarsView: View {

    let rating: Decimal

    var starSize = CGSize(width: 10, height: 9)
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<5) { step in
                star(inCompareWith: Decimal(step + 1))
            }
        }
    }

    private func star(inCompareWith compare: Decimal) -> some View {
        Image(systemSymbol: rating >= compare ? .starFill : .star)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: starSize.width, height: starSize.height)
    }

}

struct EntryLittleStarsView_Previews: PreviewProvider {
    static var previews: some View {
        EntryLittleStarsView(rating: 3.5)
    }
}
