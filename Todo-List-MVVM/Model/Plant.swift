//
//  Plant.swift
//  Todo-List-MVVM
//
//  Created by Tony Gultom on 30/08/24.
//

import Foundation

struct Plant: Identifiable {
    let id =  UUID()
    var name: String
    var wateringFrequency: Int
    var lastWateredDate: Date?
}
