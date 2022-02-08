//
//  FeedView.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/01/22.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject internal var viewModel = FeedViewModel()
    var sourceViewController: UIViewController?
    
    var body: some View {
        NavigationView {
            if let items = viewModel.items {
                List {
                    ForEach(items) { item in
                        VStack {
                        ZStack() {
                            Text(item.content)
                        }
                        VStack() {
                            Spacer()
                            Text("~ " + item.author)
                        }
                        .padding()
                        .foregroundColor(.random)
                        }
                        .padding()
                        .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
