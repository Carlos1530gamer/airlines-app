//
//  ContentView.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fligthManager = FlightsManager()
    @State private var showCreateFlightModal = false
    @State private var showEditFlightModal = false
    @State private var showDeleteConfirmation = false
    @State private var selectedFlight: Flight?
    @State private var fligthToDeleteIndex: Int?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(fligthManager.flights) { flight in
                        FligthRow(flight: flight)
                            .listRowSeparator(.hidden, edges: .all)
                            .onTapGesture {
                                selectedFlight = flight
                                showEditFlightModal.toggle()
                            }
                    }
                    .onDelete(perform: swipeToDelete)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Proximos Vuelos")
            .toolbar {  // Add button to the navigation bar
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showCreateFlightModal.toggle()
                    }) {
                        Image(systemName: "plus") // Icon for the button
                    }
                }
            }
            .sheet(isPresented: $showCreateFlightModal) {
                CreateFlightView(createFlightClosure: fligthManager.createFlight)
            }
            .sheet(isPresented: $showEditFlightModal) {
                if let selectedFlight = selectedFlight {
                    EditFlightView(flight: selectedFlight, updateFlightClosure: fligthManager.updateFlight)
                }
            }
            
            .alert(isPresented: $showDeleteConfirmation) {
                Alert(
                    title: Text("Delete Flight"),
                    message: Text("Are you sure you want to delete this flight? This action cannot be undone."),
                    primaryButton: .destructive(Text("Delete")) {
                        if let index = fligthToDeleteIndex {
                            fligthManager.deleteFlight(index: index)
                            fligthToDeleteIndex = nil
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    func swipeToDelete(at offsets: IndexSet) {
        if let index = offsets.first {
            fligthToDeleteIndex = index
            showDeleteConfirmation = true
        }
    }
}

#Preview {
    ContentView()
}
