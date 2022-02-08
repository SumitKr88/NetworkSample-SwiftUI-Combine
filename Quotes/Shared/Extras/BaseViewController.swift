//
//  BaseViewController.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/01/22.
//

import UIKit
import SwiftUI

/// Base View Controller for adding common elements
class BaseViewController: UIViewController, Navigable {

    // MARK: - Varibles/Properties/Constants

    private struct BaseViewControllerConstants {
        static let logoWidth: CGFloat = 115
        static let logoHeight: CGFloat = 32
    }
    
    // MARK: - Lifecycle Functions
    /// View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(handleBackSwipe))
    }
    
    /// Variable to hold passed data from one view to another while navigating.
    /// By default this will provide an empty data structure.
    var resolvedNavigation = ResolvedNavigation()
         
    ///Function to configure UI
    private func configureUI() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14.0)]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow, .font: UIFont.systemFont(ofSize: 14.0)]
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    @objc private func handleBackSwipe() {
        navigationController?.interactivePopGestureRecognizer?.removeTarget(self, action: #selector(handleBackSwipe))
    }
}
