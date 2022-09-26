//
//  TagsView.swift
//
//  Created by Diamonds on 02/07/1944 Saka.
//

import Foundation
import SwiftUI

/// Creates tag collection view. It requires just list of tag object.
/// For example
///
/// let data = ["Shopping", "Food", "Sports", "Fan Zones", "Movies", "Historical", "World Cup 2022 Matches"]
///
/// TagsView(tags: data.map { TagItem(tagText: $0)})

public struct TagsView: View {
    
    public let title: String?
    
    public var tags: [TagItem]
    
    @State var componentheight: CGFloat = 40.0
    
    public init(title: String? = nil, tags: [TagItem], onTagSelect: ((TagItem) -> Void)? = nil) {
        self.tags = tags
        self.title = title
    }
    
    public func sizeToFit() -> some View {
        // To -Do: Needs to fix it
        return frame(height: ceil(CGFloat(tags.count) / 3) * 50.0)
    }
    
    public var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack(alignment: .leading) {
                    if let title = title {
                        Text(title)
                            .font(.subheadline)
                            .bold()
                            .padding(.bottom, .extraSmall)
                            .padding(.top, .small)
                        
                    }
                    HStack {
                        CollectionTextItemsView(
                            availableWidth: metrics.size.width, data: tags,
                            spacing: 15,
                            alignment: .leading,
                            componentHeight: $componentheight
                        ) { item in
                            
                            Text(verbatim: item.tagText)
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding(.all, Padding.extraSmall)
                                .modifier(BackgroundModifierView(shape: Capsule(), color: item.color))
                                .onTapGesture {
                                    print("tapp === \(item.tagText)")
                                }
                        }
                        Spacer()
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.horizontal, .small)
            }
        }
    }
}

public struct TagItem: Hashable {
    public var tagId: String?
    public var tagText: String
    public var color: Color
    
    public init(tagId: String? = nil, tagText: String, color: Color = .blue) {
        self.tagText = tagText
        self.tagId = tagId
        self.color = color
    }
}

private struct CollectionTextItemsView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    @Binding var componentHeight: CGFloat
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: .leading, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }
        
        return rows
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct Previews_TagsView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ["Shopping", "Food", "Sports", "Fan Zones", "Movies", "Historical", "World Cup 2022 Matches"]
        
        TagsView(title: "Tags", tags: data.map { TagItem(tagText: $0)})
    }
}
