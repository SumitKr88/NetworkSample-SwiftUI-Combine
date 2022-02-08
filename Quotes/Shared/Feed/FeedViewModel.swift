//
//  FeedViewModel.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/01/22.
//

import Foundation
import SwiftUI
import Combine

// MARK: - HomeTabViewModel Definition
class FeedViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    // MARK: - Variables
    /// Data array for home components
    @Published var items: [Quote]?
    
    init() {
        loadlist()
    }
    
    func loadlist() {
        
        QuoteService().quotes()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    print("Error ocuured \(error)")
                case .finished:
                    break
                }
                
            }, receiveValue: { [weak self] quotesResponse in
                self?.items = quotesResponse.results
            })
            .store(in: &cancellables)
    }
}
