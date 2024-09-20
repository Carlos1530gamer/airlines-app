//
//  FligthRow.swift
//  app-airlines
//
//  Created by Carlos Daniel Hernandez Chauteco on 20/09/24.
//

import SwiftUI

struct FligthRow: View {
    let flight: Flight
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                HStack {
                    Image(systemName: "airplane")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(flight.flightNumber)
                    Spacer()
                    Text(flight.status)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .imageScale(.medium)
                        .foregroundStyle(.tint)
                    Text(flight.departure)
                    Spacer()
                    Image(systemName: "arrow.right.circle.fill")
                        .imageScale(.medium)
                        .foregroundStyle(.tint)
                    Text(flight.arrival)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Terminal:")
                    Text(flight.terminal)
                    Spacer()
                    Text("Puerta:")
                    Image(systemName: "gate.fill")
                        .imageScale(.medium)
                        .foregroundStyle(.tint)
                    Text(flight.gate)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue, lineWidth: 2) // Border color and width
                .background(Color.white.cornerRadius(15)) // Background color with the same corner radius
        )
        .shadow(radius: 5) // Optional: add shadow to give a card effect
        .padding(.horizontal)
        
    }
}

#Preview {
    FligthRow(flight: .example)
}
