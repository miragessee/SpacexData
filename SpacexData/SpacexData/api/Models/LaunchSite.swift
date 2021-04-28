//
//  LaunchSite.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import Foundation

// MARK: - LaunchSite
struct LaunchSite: Codable {
    let siteID: SiteID
    let siteName: SiteName
    let siteNameLong: SiteNameLong

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}
