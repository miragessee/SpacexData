//
//  Reuse.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - Reuse
struct Reuse: Codable {
    let core, sideCore1, sideCore2, fairings: Bool
    let capsule: Bool

    enum CodingKeys: String, CodingKey {
        case core
        case sideCore1 = "side_core1"
        case sideCore2 = "side_core2"
        case fairings, capsule
    }
}
