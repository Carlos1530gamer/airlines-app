//
//  EditFlightView.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import SwiftUI

struct EditFlightView: View {
    @State var flight: Flight = .example

    let flightStatuses = ["On Time", "Delayed", "Cancelled", "Boarding"]

    // Dismiss the modal view
    @Environment(\.dismiss) var dismiss
    
    var updateFlightClosure: (Flight) -> Void
    
    init(flight: Flight, updateFlightClosure: @escaping (Flight) -> Void) {
        self.updateFlightClosure = updateFlightClosure
        self.flight = flight
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Flight Info")) {
                    TextField("Flight Number", text: $flight.flightNumber)
                    TextField("Departure", text: $flight.departure)
                    TextField("Arrival", text: $flight.arrival)
                }
                
                Section(header: Text("Flight Status")) {
                    Picker("Status", selection: $flight.status) {
                        ForEach(flightStatuses, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Terminal & Gate")) {
                    TextField("Terminal", text: $flight.terminal)
                    TextField("Gate", text: $flight.gate)
                }
                
                Button(action: saveChanges) {
                    Text("Save Changes")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Edit Flight")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss() // Dismiss the modal
                    }
                }
            }
        }
    }

    func saveChanges() {
        updateFlightClosure(flight)
        dismiss() // Dismiss the modal after saving changes
    }
}
