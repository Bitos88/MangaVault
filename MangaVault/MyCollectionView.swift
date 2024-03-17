//
//  MyCollectionView.swift
//  MangaVault
//
//  Created by Alberto Alegre Bravo on 16/3/24.
//

import SwiftUI

struct MyCollectionView: View {
    @ObservedObject var vm = MyCollectionViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.mangas) { manga in
                    Text(manga.manga.title)
                }
            }
            .toolbar(content: {
                Button(action: {
                    vm.logout()
                }, label: {
                    Text("Logout")
                })
            })
            .navigationTitle("My Collection")
        }
    }
}

#Preview {
    MyCollectionView()
}
