//
//  FlightsManager.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import Foundation

class FlightsManager: ObservableObject {
    @Published var flights: [Flight] = [
        Flight(id: "1", flightNumber: "AM123", departure: "CDMX", arrival: "MTY", status: "On Time", terminal: "1", gate: "A1"),
        Flight(id: "2", flightNumber: "AM456", departure: "CDMX", arrival: "MTY", status: "On Time", terminal: "1", gate: "A2"),
        Flight(id: "3", flightNumber: "AM789", departure: "CDMX", arrival: "MTY", status: "On Time", terminal: "1", gate: "A3"),
    ]
}
