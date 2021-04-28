//
//  Telemetry.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - Telemetry
struct Telemetry: Codable {
    let flightClub: String?

    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
}
