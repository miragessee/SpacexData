//
//  Payload.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - Payload
struct Payload: Codable {
    let payloadID: String
    let noradID: [Int]
    let reused: Bool
    let customers: [String]
    let nationality: String?
    let manufacturer: String?
    let payloadType: PayloadType
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: String
    let orbitParams: OrbitParams
    let capSerial: String?
    let massReturnedKg, massReturnedLbs: Double?
    let flightTimeSEC: Int?
    let cargoManifest: String?
    let uid: String?

    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case noradID = "norad_id"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
        case capSerial = "cap_serial"
        case massReturnedKg = "mass_returned_kg"
        case massReturnedLbs = "mass_returned_lbs"
        case flightTimeSEC = "flight_time_sec"
        case cargoManifest = "cargo_manifest"
        case uid
    }
}
