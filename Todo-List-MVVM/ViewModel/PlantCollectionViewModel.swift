//
//  PlantCollectionViewModel.swift
//  Todo-List-MVVM
//
//  Created by Tony Gultom on 30/08/24.
//

import Foundation

class PlantCollectionViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    
    func addPlant (_ plant: Plant) {
        plants.append(plant)
    }
    
    func removePlant (_ plant: Plant) {
        plants.removeAll {$0.id == plant.id}
    }
    
    func updateWatering(for plant: Plant) {
        if let index = plants.firstIndex(where: {$0.id == plant.id}) {
            plants[index].lastWateredDate = Date()
        }
    }
}
