//
//  Config.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

enum Command: String {
    case cleanup = "cleanup"
    case expired = "expired"
    case list    = "list"
    case search  = "search"
    case version = "version"
    
    enum Option: String {
        case delete = "--delete"
        case move   = "--move"
    }
}

struct Config {
    static let version: String = "1.0.1"
    
    static let provisioningDir: String = "/Library/MobileDevice/Provisioning Profiles/"
    static let provisioningExt: String = ".mobileprovision"
    
    static var homeDir: String {
        return URL(fileURLWithPath: NSHomeDirectory()).path
    }
    
    static var desktopDirPath: String {
        return NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true).first! + "/"
    }
    
    static var provisioningDirPath: String {
        return homeDir + provisioningDir
    }
    
    static let expirationDateFormat: String = "YYYY-MM-dd'T'HH:mm:ssZ"
    static let destinationDirDateFormat: String = "YYYYMMdd-HHmmss"
    static let localeId: String = "en_US_POSIX"
}
