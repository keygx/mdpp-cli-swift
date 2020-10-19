//
//  Open.swift
//  mdpp
//
//  Created by keygx on 2020/10/15.
//

import Foundation

final class Open {
    static func execute() -> String {
        // ex: open "/Users/[user]/Library/MobileDevice/Provisioning Profiles/"
        let path = Config.homeDir + "/Library/MobileDevice/Provisioning Profiles/"
        
        guard File.isExist(path: path) else { return "The Directory '\(path)' does not exist." }
        
        var options = [String]()
        options.append(path)
        
        _ = CmdLine.execute(cmd: "/usr/bin/open", args: options)
        return path
    }
}
