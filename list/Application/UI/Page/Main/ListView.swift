//
//  ListView.swift
//  List
//
//  Created by shin.sekaryo on 2022/06/08.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            List {
                Section(header: Text("ヘッダー")) {
                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)
                    
                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)

                    
                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)

                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)

                    Section(header: Text("サブセクションは実現できない？")) {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                    }
                    .background(Color.accentColor)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            
            List {
                Section(header: Text("リスト2")) {
                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)
                    
                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)

                    
                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)

                    VStack {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                        Text("aaaaaa")
                        Text("bbbbbb")
                    }
                    .padding(.vertical, 50)

                    Section(header: Text("サブセクションは実現できない？")) {
                        Text("aaaaaa")
                        Text("bbbbbb")
                        Text("cccccc")
                    }
                    .background(Color.accentColor)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
        }
    }
}

#if DEBUG
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
#endif
