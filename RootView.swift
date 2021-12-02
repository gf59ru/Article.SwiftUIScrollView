//
//  Rootiew.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 20.10.2021.
//

import SwiftUI
import OSLog

import SDWebImageSwiftUI
import SFSafeSymbols

struct RootView: View {
    
    @State private var rate: Decimal? = 3.8
    
    // MARK: - Vars
    
    private func scrolledEnoughToShowTopBar(scrollOffset: CGFloat) -> Bool {
        -scrollOffset > -90
    }
    
    private var topBarHeight: CGFloat {
        UIApplication.shared.safeAreaInsets.top + 42
    }

    private func topBackgroundOffset(scrollOffset: CGFloat) -> CGFloat {
        min(-scrollOffset, -scrollOffset * 0.9 - topBarHeight)
    }

    private func topImageOffset(scrollOffset: CGFloat) -> CGFloat {
        let bounds = UIScreen.main.bounds
        return -scrollOffset * 0.8 - bounds.height / 20
    }

    // MARK: - UI

    @ViewBuilder
    var body: some View {
        let screenBounds = UIScreen.main.bounds
        ZStack(alignment: .top) {
            AnimatedImage(url: URL(string: "https://images.pexels.com/photos/8856514/pexels-photo-8856514.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))
                .blur(radius: 4)
                .frame(width: screenBounds.width, height: screenBounds.height)
                .aspectRatio(contentMode: .fill)
                .clipped()

            scrollBody.padding(.top, -200)
        }
        .ignoresSafeArea(.all, edges: [.top, .bottom])
    }

    private func topBackgroundBody(offset: CGFloat) -> some View {
        AnimatedImage(url: URL(string: "https://images.pexels.com/photos/10288317/pexels-photo-10288317.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height / 1.5)
            .aspectRatio(contentMode: .fill)
            .clipped()
            .offset(y: topBackgroundOffset(scrollOffset: offset))
    }

    @ViewBuilder
    private var scrollBody: some View {
        let size = UIScreen.main.bounds
        ScrollView {
            LazyVStack {
                Color.clear
                    .frame(width: size.width, height: size.height - 40)
                ZStack(alignment: .top) {
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .named("scroll")).minY
                        Text("\(offset)")
                        topBackgroundBody(offset: offset)
                        EntryInfoView(imageOffset: topImageOffset(scrollOffset: offset))
                    }

                    scrollContentBody
                }
                Color.clear
                    .frame(width: size.width,
                           height: UIApplication.shared.safeAreaInsets.bottom)
            }
        }
    }
    
    private var scrollContentBody: some View {
        LazyVStack(spacing: 0) {
            EntryScrollHeader()

            ZStack {
                VStack(spacing: 0) {
                    hugeSeparator
                    separator
                    hugeSeparator
                    RateView(rate: $rate, swipeEnabled: true)
                    hugeSeparator
                    EntryItemPairingView()
                    EntryAboutView()
                }
            }
            VStack(spacing: 0) {
                EntryNotesView()
                EntryMapView()
                EntryBestItemsView()
                EntryLatestCommentsView()
            }
        }
    }

}

struct RootView_Previews: PreviewProvider {

    static var previews: some View {
        RootView()
    }

}
