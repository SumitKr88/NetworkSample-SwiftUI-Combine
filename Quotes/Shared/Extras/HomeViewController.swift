//
//  HomeViewController.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/01/22.
//

import Foundation
import SwiftUI

class HomeViewHostingController: BaseViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var rootView = FeedView()
        rootView.sourceViewController = self
        add(asChildViewController: UIHostingController(rootView: rootView), contextView: view)
    }
}
