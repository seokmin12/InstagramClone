//
//  ContentView.swift
//  InstagramClone
//
//  Created by 이석민 on 2022/03/05.
//

import SwiftUI

struct StoryView: View {
    let name: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "person.fill").font(.system(size: 35)).scaleEffect(x: -1, y: 1, anchor: .center).padding(9)
                .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.red, lineWidth: 2))
                .shadow(radius: 10)
            Text("\(name)").font(.system(size: 13)).padding(5)
        }
    }
}

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Instagram").font(Font.custom("Snell Roundhand Bold", size: 25))
                Spacer()
                HStack {
                    Image(systemName: "plus.app").font(.system(size: 25)).padding(5)
                    Image(systemName: "heart").font(.system(size: 25)).padding(5)
                    Image(systemName: "paperplane").font(.system(size: 25)).padding(5)
                }
            }
            ScrollView {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            VStack(spacing: 0) {
                                Image(systemName: "person.crop.circle.badge.plus").font(.system(size: 45)).scaleEffect(x: -1, y: 1, anchor: .center).padding(5)
                                Text("내 스토리").font(.system(size: 13))
                            }
                            StoryView(name: "min_e_coder")
                            StoryView(name: "lee_seokmin__")
                            StoryView(name: "every__nn")
                            StoryView(name: "avecqmour")
                            StoryView(name: "j_chaeyeoni")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
