//
//  CreateFligthView.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import SwiftUI

struct CreateFlightView: View {
    @State private var flightNumber = ""
    @State private var departure = ""
    @State private var arrival = ""
    @State private var status = "On Time"
    @State private var terminal = ""
    @State private var gate = ""
    
    let flightStatuses = ["On Time", "Delayed", "Cancelled", "Boarding"]
    
    var createFlightClosure: (Flight) -> Void

    // Dismiss the modal view
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Flight Info")) {
                    TextField("Flight Number", text: $flightNumber)
                    TextField("Departure", text: $departure)
                    TextField("Arrival", text: $arrival)
                }
                
                Section(header: Text("Flight Status")) {
                    Picker("Status", selection: $status) {
                        ForEach(flightStatuses, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Terminal & Gate")) {
                    TextField("Terminal", text: $terminal)
                    TextField("Gate", text: $gate)
                }
                
                Button(action: createFlight) {
                    Text("Create Flight")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Create Flight")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss() // Dismiss the modal
                    }
                }
            }
        }
    }

    func createFlight() {
        let newFlight = Flight(id: UUID().uuidString,
                                       flightNumber: flightNumber,
                                       departure: departure,
                                       arrival: arrival,
                                       status: status,
                                       terminal: terminal,
                                       gate: gate)
        createFlightClosure(newFlight)
        dismiss() // Dismiss the modal after creating the flight
    }
}
