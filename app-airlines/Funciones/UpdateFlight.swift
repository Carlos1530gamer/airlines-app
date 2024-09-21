//
//  UpdateFlight.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import Foundation

extension FlightsManager {
    func updateFlight(flight: Flight) {
        let index = flights.firstIndex { $0.id == flight.id }! // Es el indice de donde se encuentra el vuelo que se quiere actualizar
        // Recuerde que para hacer llamado a los vuelos use el parametro "flights"
        flights[index] = flight
    }
}
