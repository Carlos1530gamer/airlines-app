//
//  CreateFligth.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import Foundation

extension FlightsManager {
    func createFlight(flight: Flight) {
        // Recuerde que para hacer llamado a los vuelos use el parametro "flights"
        //flights
        flights.append(flight)
    }
}
