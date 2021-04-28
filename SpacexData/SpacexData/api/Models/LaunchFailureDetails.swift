//
//  LaunchFailureDetails.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - LaunchFailureDetails
struct LaunchFailureDetails: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}
