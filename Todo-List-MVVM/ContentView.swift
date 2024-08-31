//
//  ContentView.swift
//  Todo-List-MVVM
//
//  Created by Tony Gultom on 30/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    /*
     ViewModel Binding: Utilizes PlantCollectionViewModel for underlying logic and data.
     */
    @ObservedObject var viewModel = PlantCollectionViewModel()
    @State private var showingAddPlant = false
    @State private var plantNameInput = ""
    @State private var plantWaterFrequencyInput = 1
    
    
    private func deletePlant(at offsets: IndexSet) {
        offsets.forEach { viewModel.removePlant(viewModel.plants[$0]) }
    }
    
    private func addPlant() {
        viewModel.addPlant(
            Plant(
                name: plantNameInput, wateringFrequency: plantWaterFrequencyInput)
        )
    }
    
    private func clearInputs() {
        plantNameInput = ""
        plantWaterFrequencyInput = 1
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.plants) {
                    plant in HStack {
                        Text(plant.name)
                        Spacer()
                        Text("Water Every \(plant.wateringFrequency) days")
                        Button(action: { viewModel.updateWatering(for: plant) }) {
                            Image(systemName: "drop.fill")
                        }
                    }
                }.onDelete(perform: deletePlant)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddPlant.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Add Plant", isPresented: $showingAddPlant) {
                TextField("Plant Name", text: $plantNameInput)
                TextField("Water Frequency", value: $plantWaterFrequencyInput, formatter: NumberFormatter())
                Button("OK", action: addPlant)
                Button("Cancel", role: .cancel, action: clearInputs)
            }
            .navigationTitle("My Plants")
        }
           
    }
}


#Preview {
    ContentView()
}
