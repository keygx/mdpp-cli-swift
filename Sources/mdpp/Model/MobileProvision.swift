//
//  MobileProvision.swift
//  mdpp
//
//  Created by keygx on 2017/10/02.
//

import Foundation

struct MobileProvision: Codable {
    let profileName: String
    let fileName: String
    let filePath: String
    let expiration: Date
    let modified: Date
}
