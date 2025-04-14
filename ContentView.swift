//
//  ContentView.swift
//  SettingExample
//
//  Created by A. Zheng (github.com/aheze) on 2/22/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedIndex") var selectedIndex = 1
    var body: some View {
        TabView(selection: $selectedIndex) {
            PreferencesView()
                .tabItem {
                    Label("配置", systemImage: "text.book.closed")
                }
                .tag(0)

            SettingsView()
                .tabItem {
                    Label("设置", systemImage: "gearshape")
                }
                .tag(1)

            ControlPanelView()
                .tabItem {
                    Label("控制面板", systemImage: "dial.high")
                }
                .tag(2)
            
            PlaygroundView()
                .tabItem {
                    Label("Playground", systemImage: "gamecontroller")
                }
                .tag(3)
        }
    }
}
