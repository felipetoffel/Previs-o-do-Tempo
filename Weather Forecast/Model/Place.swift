//
//  Place.swift
//  Weather Forecast
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import Foundation

class Place: NSObject {
    let name: String?
    let placeDescription: String?
    var icon: String?
    var temperature: String?
    
    init(name: String, placeDescription: String, icon: String, temperature: String) {
        self.name = name
        self.placeDescription = placeDescription
        self.icon = icon
        self.temperature = temperature
    }
}
