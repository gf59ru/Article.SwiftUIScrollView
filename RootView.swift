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

struct ScrollOffsetPreferenceKey: PreferenceKey {

    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

}

struct RootView: View {
    
    @State private var scrollOffset = CGFloat(0)
    @State private var rate: Decimal? = 3.8
    
    // MARK: - Vars
    
    private var scrolledEnoughToShowTopBar: Bool {
        -scrollOffset > -90
    }
    
    private var topBarHeight: CGFloat {
        UIApplication.shared.safeAreaInsets.top + 42
    }

    private var topBackgroundOffset: CGFloat {
        let bounds = UIScreen.main.bounds
        return scrollOffset / 10 - bounds.height / 8
    }

    private var topImageOffset: CGFloat {
        let bounds = UIScreen.main.bounds
        return scrollOffset / 5 - bounds.height / 20
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

            Group {
                topBackgroundBody
                EntryInfoView(imageOffset: topImageOffset)
                scrollBody.padding(.top, -200)
            }
        }
        .ignoresSafeArea(.all, edges: [.top, .bottom])
    }

    private var topBackgroundBody: some View {
        AnimatedImage(url: URL(string: "https://images.pexels.com/photos/10288317/pexels-photo-10288317.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height / 1.5)
            .aspectRatio(contentMode: .fill)
            .clipped()
            .offset(y: topBackgroundOffset)
    }

    @ViewBuilder
    private var scrollBody: some View {
        let size = UIScreen.main.bounds
        ScrollView {
            LazyVStack {
                Color.clear
                    .frame(width: size.width, height: size.height - 40)
                ZStack(alignment: .top) {
                    scrollContentBody

                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .named("scroll")).minY
                        Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: offset)
                    }
                }
                Color.clear
                    .frame(width: size.width,
                           height: UIApplication.shared.safeAreaInsets.bottom)
            }
        }
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            scrollOffset = value
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
