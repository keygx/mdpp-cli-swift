//
//  Help.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

final class Help {
    static func execute() -> String {
        let help = """
        OVERVIEW:
            Search .mobileprovision file from '~/Library/MobileDevice/Provisioning Profiles/' directory
        
        USAGE:
            mdpp commands [options] [arguments...]
        
        EXAMPLE:
            mdpp cleanup [ --delete | --move ]
            mdpp expired [ --path ]
            mdpp help
            mdpp list [ --path ]
            mdpp search [ profile name | keyword ] [ --path ]
            mdpp version
        
        COMMANDS:
            cleanup   Move or delete, expired profiles or old profiles.
            expired   List the expired profiles.
            help      Display help.
            list      List the installed profiles.
            search    List search results from profile name or keywords.
            version   Display version.
        
        OPTIONS:
            --delete    cleanup --delete : Delete. (Default)
            --move      cleanup --move   : Move to temp folder. ex. ~/Desktop/Expired-Profiles-YYYYMMdd-HHmmss/
            --path      expired --path   : Output only file path
                        list --path      : Output only file path
                        search [ keyword ] --path : Output only file path
        
        VERSION:
            \(Config.version)
        
        """
        
        return help
    }
}
