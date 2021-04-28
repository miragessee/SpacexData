//
//  PayloadType.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

enum PayloadType: String, Codable {
    case crewDragon = "Crew Dragon"
    case dragon10 = "Dragon 1.0"
    case dragon11 = "Dragon 1.1"
    case dragonBoilerplate = "Dragon Boilerplate"
    case lander = "Lander"
    case satellite = "Satellite"
}
