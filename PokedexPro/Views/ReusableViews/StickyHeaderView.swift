//
//  StickyHeaderView.swift
//  PokedexPro
//
//  Created by TriBQ on 22/09/2023.
//

import Foundation
import SwiftUI
import SwiftUtilities
import ViewExtensionForSwiftUI

public struct ImageStickyHeaderView<
    Content: View,
    Header: View
>: View {
    public init(
        headerHeight: CGFloat,
        isHeaderHidden: Binding<Bool>,
        content: @escaping () -> Content,
        header: @escaping () -> Header
    ) {
        self.headerHeight = headerHeight
        self._isHeaderHidden = isHeaderHidden
        self.content = content
        self.header = header
    }

    var headerHeight: CGFloat
    var content: () -> Content
    var header: () -> Header

    @Binding
    private var isHeaderHidden: Bool

    public var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    imagesView

                    content()

                    Spacer()
                }
            }

        }
        .animation(.easeInOut(duration: 0.15), value: isHeaderHidden)
    }
}

extension ImageStickyHeaderView {
    private var imagesView: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .scrollView).minY
            let size = proxy.size
            let height = size.height + minY

            header()
                .frame(
                    width: size.width,
                    height: height > 0 ? height : .leastNonzeroMagnitude,
                    alignment: .top
                )
                .offset(y: -minY)
                .onChange(
                    of: height,
                    { oldValue, newValue in
                        isHeaderHidden = newValue < 0
                    }
                )
        }
        .frame(height: headerHeight)
    }
}
