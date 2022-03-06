//
//  TabBarView.swift
//  InstagramClone
//
//  Created by 이석민 on 2022/03/05.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
        }.accentColor(.white)
    }
}
