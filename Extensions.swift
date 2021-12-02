//
//  UIApplication.swift
//  Article.SwiftUIScrollView
//
//  Created by Nikolai Borovennikov on 23.11.2021.
//

import UIKit
import SwiftUI

struct CornerRadiusModifier: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension Decimal {
    var ratingString: String {
        String(format: "%2.1f", NSDecimalNumber(decimal: self).doubleValue)
    }
}

extension UIScreen {
    var onePixel: CGFloat { 1 / scale }
}

extension View {
    var separator: some View {
        Color.black.opacity(0.1)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.onePixel)
    }

    var hugeSeparator: some View {
        Color.gray
            .frame(height: 4)
    }

    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusModifier(radius: radius, corners: corners))
    }
}

extension UIApplication {
    public var safeAreaInsets: EdgeInsets {
        guard let window = connectedScenes
                .compactMap({
                    $0 as? UIWindowScene
                })
                .flatMap({
                    $0.windows
                })
                .first(where: {
                    $0.isKeyWindow
                }) else {
                    return EdgeInsets()
                }
        let insets = window.safeAreaInsets
        return EdgeInsets(top: insets.top,
                          leading: insets.left,
                          bottom: insets.bottom,
                          trailing: insets.right)
    }
}
