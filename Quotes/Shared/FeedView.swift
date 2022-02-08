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
                        Text(item.content)
                    }
                }
            }
        }
        //.navigationBarTitle("SwiftUI", displayMode: .inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
