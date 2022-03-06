//
//  MainView.swift
//  InstagramClone
//
//  Created by 이석민 on 2022/03/05.
//

import Foundation
import SwiftUI

struct Member: Codable, Identifiable {
    enum CodingKeys: CodingKey {
            case name
            case img
        }
        
        var id = UUID()
        var name: String
        var img: String
}

class ReadMemberData: ObservableObject {
    @Published var members = [Member]()
    
    init() {
        select_member()
    }
    
    func select_member() {
        guard let url = URL(string: "http://18.222.134.236/instagram_clone/database/select_story_profile.php") else {
            print("Invaild URL")
            return
        }
        let data = try? Data(contentsOf: url)
        let member_data = try? JSONDecoder().decode([Member].self, from: data!)
        self.members = member_data!
    }
}

struct StoryView: View {
    @ObservedObject var datas = ReadMemberData()
    
    var body: some View {
        ForEach(datas.members) {
            member in
            VStack(spacing: 0) {
                Image(uiImage: UIImage(data: Data(base64Encoded: member.img)!)!).resizable().frame(width: 65, height: 65).cornerRadius(50).padding(3)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.red, lineWidth: 2))
                Text("\(member.name)").frame(width: 60).lineLimit(1).font(.system(size: 11)).padding(5)
            }
        }
    }
}

struct PostView: View {
    var body: some View {
        Text("hi")
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
            }.padding()
            ScrollView {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            VStack(spacing: 0) {
                                Image(systemName: "person.crop.circle.badge.plus").font(.system(size: 50)).scaleEffect(x: -1, y: 1, anchor: .center)
                                Text("내 스토리").font(.system(size: 11)).padding(.top, 6)
                            }.padding(5)
                            StoryView()
                        }
                    }
                }
                Section {
                    PostView()
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
