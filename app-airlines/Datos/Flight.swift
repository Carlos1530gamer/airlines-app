//
//  Flight.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import Foundation

struct Flight: Identifiable {
    var id: String
    var flightNumber: String
    var departure: String
    var arrival: String
    var status: String
    var terminal: String
    var gate: String
    
    static let example = Flight(id: "1", flightNumber: "AM123", departure: "CDMX", arrival: "MTY", status: "On Time", terminal: "1", gate: "A1")
}
