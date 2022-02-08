//
//  Navigable.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/01/22.
//

import Foundation
import UIKit

/// Protocol to transfer data between views while navigating.
/// `BaseViewController` always confirms to this protocol and hence any controller
/// that is a subclass of `BaseViewController` will also be confirming to this protocol.
protocol Navigable: AnyObject {

    /// Varirable providing data as `ResolvedNavigation` structure
    /// Confirming class must provide definition.
    var resolvedNavigation: ResolvedNavigation { get set }

}

// Structure to hold passed info while navigating
struct ResolvedNavigation {
    /// Passed user data
    /// This may be nil if user soes not pass any data from source controller
    var userData: Any?

    /// Source from where navigation is initiated
    /// This will always be populated while navigation
    var source: UIViewController?
}

