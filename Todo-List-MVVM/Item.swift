//
//  Item.swift
//  Todo-List-MVVM
//
//  Created by Tony Gultom on 30/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
