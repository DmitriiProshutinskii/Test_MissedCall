//
//  Call.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import Foundation

class Calls : Decodable {
    let requests: [Call]
}

class Call: Identifiable, Decodable, Hashable {
    static func == (lhs: Call, rhs: Call) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String {
        didSet { id = String(Int.random(in: 1..<1000)) }
      }
    
    let state: String?
    var client: Client
    let type: String?
    let created: String
    let businessNumber: Number
    let origin: String?
    let favorite: Bool
    let duration: String
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var durationOfCall: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let startTime = dateFormatter.date(from: duration)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "mm:ss"
        return dateFormatter2.string(from: startTime!)
    }
    
    var dateOfCall: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        let startTime = dateFormatter.date(from: created)

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"

        return formatter.string(from: startTime!)
    }
}

class Client: Decodable {
    var address: String
    var Name: String?
}

class Number: Decodable {
    var number: String
    var label: String 
}
