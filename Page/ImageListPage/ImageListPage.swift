//
//  ImageListPage.swift
//  DairoUI-IOS-DEMO
//
//  Created by zhoulq on 2025/04/21.
//

import SwiftUI
import DairoUI_IOS

struct ImageListPage: View {
    let items = Array(1...5)
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    CacheImage(url: "http://192.168.1.60:8031/d/oq8221/WechatIMG2.jpg?wait=1000&count=456fgh")
                }
                .padding()
            }.navigationTitle("图片列表")
        }
    }
}

#Preview {
    ImageListPage()
}
