//
//  EntryItemPairingView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 31.10.2021.
//

import SwiftUI
import SFSafeSymbols

struct ItemPair {
    let id = UUID()
    let name: String
    let icon: Image
    let color: Color
    let checkedCount: Int
    let checkedByUser: Bool
}

struct EntryItemPairingView: EntryInfoBlockView {

    private var pairs: [ItemPair] = [
        ItemPair(name: "46489",
                 icon: Image(systemSymbol: .bag),
                 color: .green,
                 checkedCount: 3182,
                 checkedByUser: false),
        ItemPair(name: "54489",
                 icon: Image(systemSymbol: .cross),
                 color: .blue,
                 checkedCount: 57,
                 checkedByUser: false),
        ItemPair(name: "59884",
                 icon: Image(systemSymbol: .doc),
                 color: .red,
                 checkedCount: 731,
                 checkedByUser: true),
        ItemPair(name: "4566",
                 icon: Image(systemSymbol: .cart),
                 color: .yellow,
                 checkedCount: 3182,
                 checkedByUser: false),
        ItemPair(name: "546796",
                 icon: Image(systemSymbol: .sdcard),
                 color: .orange,
                 checkedCount: 57,
                 checkedByUser: false),
        ItemPair(name: "9567964",
                 icon: Image(systemSymbol: .photoTv),
                 color: .purple,
                 checkedCount: 731,
                 checkedByUser: false),
        ItemPair(name: "24635856",
                 icon: Image(systemSymbol: .teletype),
                 color: .brown,
                 checkedCount: 3182,
                 checkedByUser: false),
        ItemPair(name: "769856",
                 icon: Image(systemSymbol: .hurricane),
                 color: .cyan,
                 checkedCount: 57,
                 checkedByUser: true),
        ItemPair(name: "4685742",
                 icon: Image(systemSymbol: .timer),
                 color: .indigo,
                 checkedCount: 731,
                 checkedByUser: false),
        ItemPair(name: "6794853",
                 icon: Image(systemSymbol: .qrcode),
                 color: .pink,
                 checkedCount: 3182,
                 checkedByUser: false),
        ItemPair(name: "908482",
                 icon: Image(systemSymbol: .projective),
                 color: .mint,
                 checkedCount: 57,
                 checkedByUser: false),
        ItemPair(name: "18149",
                 icon: Image(systemSymbol: .eject),
                 color: .teal,
                 checkedCount: 731,
                 checkedByUser: false),
    ]

    @State var isPairsCollapsed = true

    var titleIcon: SFSymbol { .checkmark }

    var title: String { "Checks" }

    @ViewBuilder
    var mainBody: some View {
        let width = UIScreen.main.bounds.width / 3 - 16
        let columns: [GridItem] = [
            GridItem(.fixed(width)),
            GridItem(.fixed(width)),
            GridItem(.fixed(width))
        ]
        LazyVGrid(columns: columns, spacing: 8) {
            let items = isPairsCollapsed ? Array(pairs.prefix(upTo: 6)) : pairs

            ForEach(items, id: \.id) { item in
                foodPairBody(item, width: width)
            }
        }
        separator

        Button {
            isPairsCollapsed.toggle()
        } label: {
            Text(isPairsCollapsed ? "Show all (\(pairs.count)) items" : "Hide extra items")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 38)
        }
    }

    private func foodPairBody(_ item: ItemPair, width: CGFloat) -> some View {
        ZStack {
            if item.checkedByUser {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            }
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    item.icon
                        .font(.system(size: 40))
                        .foregroundColor(item.color)
                        .padding(5)
                    if item.checkedByUser {
                        Image(systemSymbol: .checkmarkCircle)
                            .font(.system(size: 20))
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                }
                .padding(5)
                .shadow(color: item.color.opacity(0.5),
                        radius: 2, x: 1, y: 1)

                Text(item.name)
                    .font(.system(size: 11))
                    .foregroundColor(.black)

                HStack(spacing: 0) {
                    if item.checkedByUser {
                        Text("You")
                            .font(.system(size: 11, weight: .bold, design: .default))
                            .foregroundColor(.black)
                        Text(" and ")
                            .font(.system(size: 11))
                            .foregroundColor(.black)
                    }
                    Text("\(item.checkedCount)")
                        .font(.system(size: 11))
                        .foregroundColor(.black)
                }
            }
        }
        .frame(width: width, height: width * 104.0 / 99.0)
    }

}

struct EntryItemPairingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            EntryItemPairingView()
        }
    }
}
