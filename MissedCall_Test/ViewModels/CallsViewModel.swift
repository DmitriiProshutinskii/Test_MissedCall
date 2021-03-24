//
//  CallsViewModel.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import SwiftUI

class CallsViewModel: ObservableObject {
    
    @Published var calls: [Call]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: CallsServices
    
    init(movieService: CallsServices = CallsStore.shared) {
        self.movieService = movieService
    }
    
    func loadCalls(){
        self.calls = nil
        self.isLoading = true
        self.movieService.fetchCalls() { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            print(result)
            switch result {
            case .success(let response):
                self.calls = response.requests
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
