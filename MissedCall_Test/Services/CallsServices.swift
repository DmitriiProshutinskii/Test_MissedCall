//
//  MissedCallsServices.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import Foundation

protocol CallsServices {
    
    func fetchCalls(completion: @escaping (Result<Calls, CallError>) -> ())
    //func fetchCall(id: Int, completion: @escaping (Result<Call, CallError>) -> ())
}

enum CallError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}


