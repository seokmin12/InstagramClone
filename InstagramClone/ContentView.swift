//
//  ContentView.swift
//  InstagramClone
//
//  Created by 이석민 on 2022/03/05.
//

import SwiftUI

struct ContentView: View {
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
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
