//
//  ContentView.swift
//  Shared
//
//  Created by Sumit Kumar on 07/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        TabView {
            
            FeedView()
                        .tabItem {
                            Label("Quotes", systemImage: "ipad.homebutton.badge.play")
                        }

            FavouriteView()
                        .tabItem {
                            Label("Random Quote", systemImage: "list.and.film")
                        }
                }
        .accentColor(.red)
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
            .navigationBarTitle("Quotes List", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct FavouriteView: View {
    var body: some View {
        Text("Favourites List")
    }
}

