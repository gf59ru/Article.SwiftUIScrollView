//
//  EntryScrollHeader.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 30.10.2021.
//

import SwiftUI
import SFSafeSymbols

struct EntryScrollHeader: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack {
                    Text("Description")
                }

                Spacer()

                Button {

                } label: {
                    Image(systemSymbol: .bookmark)
                        .foregroundColor(.black.opacity(0.25))
                        .font(.system(size: 25, weight: .regular, design: .default))
                }
            }
            .padding(.bottom, 4)

            HStack {
                VStack {
                    Text("Lorem")
                    Text("Ipsum")
                }
                Spacer()
            }

        }
        .frame(height: 76)
        .padding([.leading, .trailing], 15)
        .padding(.top, 12)
        .background(Color.white)
    }
}

struct EntryScrollHeader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            EntryScrollHeader()
        }
    }
}
