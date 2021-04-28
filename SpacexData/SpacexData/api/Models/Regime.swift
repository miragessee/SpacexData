//
//  Regime.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

enum Regime: String, Codable {
    case geostationary = "geostationary"
    case geosynchronous = "geosynchronous"
    case highEarth = "high-earth"
    case highlyElliptical = "highly-elliptical"
    case l1Point = "L1-point"
    case lowEarth = "low-earth"
    case mediumEarth = "medium-earth"
    case semiSynchronous = "semi-synchronous"
    case subOrbital = "sub-orbital"
    case sunSynchronous = "sun-synchronous"
    case veryLowEarth = "very-low-earth"
}
