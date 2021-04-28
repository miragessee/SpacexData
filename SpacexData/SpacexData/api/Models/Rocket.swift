//
//  Rocket.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - Rocket
struct Rocket: Codable {
    let rocketID: RocketID
    let rocketName: RocketName
    let rocketType: RocketType
    let firstStage: FirstStage
    let secondStage: SecondStage
    let fairings: Fairings?

    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}
