//
//  LaunchesModelElement.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - LaunchesModelElement
public struct LaunchesModelElement: Codable {
    let flightNumber: Int
    let missionName: String
    let missionID: [String]
    let upcoming: Bool
    let launchYear: String
    let launchDateUnix: Int
    let launchDateUTC: String
    let launchDateLocal: Date
    let isTentative: Bool
    let tentativeMaxPrecision: TentativeMaxPrecision
    let tbd: Bool
    let launchWindow: Int?
    let rocket: Rocket
    let ships: [String]
    let telemetry: Telemetry
    let reuse: Reuse
    let launchSite: LaunchSite
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let links: Links
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let timeline: [String: Int?]?
    let crew: [JSONAny]?
    let lastDateUpdate: String?
    let lastLlLaunchDate, lastLlUpdate: String?
    let lastWikiLaunchDate, lastWikiRevision, lastWikiUpdate: String?
    let launchDateSource: LaunchDateSource?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case upcoming
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, ships, telemetry, reuse
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case launchFailureDetails = "launch_failure_details"
        case links, details
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case timeline, crew
        case lastDateUpdate = "last_date_update"
        case lastLlLaunchDate = "last_ll_launch_date"
        case lastLlUpdate = "last_ll_update"
        case lastWikiLaunchDate = "last_wiki_launch_date"
        case lastWikiRevision = "last_wiki_revision"
        case lastWikiUpdate = "last_wiki_update"
        case launchDateSource = "launch_date_source"
    }
}
