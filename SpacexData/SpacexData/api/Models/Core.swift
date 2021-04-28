//
//  Core.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - Core
struct Core: Codable {
    let coreSerial: String
    let flight: Int
    let block: Int?
    let gridfins, legs, reused: Bool
    let landSuccess: Bool?
    let landingIntent: Bool
    let landingType: LandingType?
    let landingVehicle: LandingVehicle?

    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, block, gridfins, legs, reused
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
    }
}
