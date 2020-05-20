//
//  ProvisioningProfile.swift
//  mdpp
//
//  Created by keygx on 2017/09/29.
//

import Foundation

enum Tag: String {
    case name = "<key>Name</key>"
    case expiration = "<key>ExpirationDate</key>"
}

final class ProvisioningProfile {
    static let pattern = "<(\"[^\"]*\"|'[^']*'|[^'\">])*>"
    
    static func search(path: String, tag: Tag) -> String {
        let result = egrep(path: path, tag: tag.rawValue)
        let value = result
            .replacingOccurrences(of: tag.rawValue, with: "")
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        return value.pregReplace(pattern: ProvisioningProfile.pattern, with: "")
    }
    
    static func egrep(path: String, tag: String) -> String {
        // ex: egrep -a -A 1 "<key>Name</key>" "/Users/[user]/Library/MobileDevice/Provisioning Profiles/********************************.mobileprovision"
        var options = [String]()
        options.append("-a")
        options.append("-A")
        options.append("1")
        options.append(tag)
        options.append(path)
        
        return CmdLine.execute(cmd: "/usr/bin/egrep", args: options)
    }
}
