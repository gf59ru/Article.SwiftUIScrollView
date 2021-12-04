//
//  EntryNotesView.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 06.11.2021.
//

import SwiftUI
import SFSafeSymbols

struct EntryNotesView: EntryInfoBlockView {

    var title: String { "A little text" }

    var titleIcon: SFSymbol { .note }

    var mainBody: some View {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            .font(.system(size: 13))
            .padding(16)
    }

}

struct EntryNotesView_Previews: PreviewProvider {
    static var previews: some View {
        EntryNotesView()
    }
}
