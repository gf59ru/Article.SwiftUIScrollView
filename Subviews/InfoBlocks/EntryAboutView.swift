//
//  EntryAboutView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 03.11.2021.
//

import SwiftUI
import SFSafeSymbols

struct EntryAboutView: EntryInfoBlockView {

    @State private var aboutCollapsed = true

    var titleIcon: SFSymbol { .textBubble }

    var title: String { "Just text" }

    @ViewBuilder
    var mainBody: some View {
        Text("Lorem")
            .foregroundColor(.black)
            .font(.system(size: 18))
            .padding(.top, 16)
        Text("ipsum")
            .foregroundColor(.black)
            .font(.system(size: 20))
            .padding(.bottom, 16)

        separator

        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            .foregroundColor(.black)
            .font(.system(size: 13))
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], 16)
            .frame(maxHeight: aboutCollapsed ? 100 : .infinity)

        separator

        Button {
            aboutCollapsed.toggle()
        } label: {
            Text("More text")
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
                .frame(height: 30)
                .frame(maxWidth: .infinity)
        }
    }

}

struct EntryAboutView_Previews: PreviewProvider {
    static var previews: some View {
        EntryAboutView()
    }
}
