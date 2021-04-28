//
//  ReferenceSystem.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

enum ReferenceSystem: String, Codable {
    case geocentric = "geocentric"
    case heliocentric = "heliocentric"
    case highlyElliptical = "highly-elliptical"
}
