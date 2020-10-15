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
            mdpp expired [ --path | --json ]
            mdpp help
            mdpp list [ --path | --json ]
            mdpp open
            mdpp search [ profile name | keyword ] [ --path | --json ]
            mdpp version
        
        COMMANDS:
            cleanup   Move or delete, expired profiles or old profiles.
            expired   List the expired profiles.
            help      Display help.
            list      List the installed profiles.
            open      Open '~/Library/MobileDevice/Provisioning Profiles/' directory
            search    List search results from profile name or keywords.
            version   Display version.
        
        OPTIONS:
            --delete    cleanup --delete : Delete. (Default)
            --move      cleanup --move   : Move to temp folder. ex. ~/Desktop/Expired-Profiles-YYYYMMdd-HHmmss/
            --path      expired --path   : Output only file path
                        list --path      : Output only file path
                        search [ keyword ] --path : Output only file path
            --json      expired --json   : Output JSON format
                        list --json      : Output JSON format
                        search [ keyword ] --json : Output JSON format
        
        VERSION:
            \(Config.version)
        
        """
        
        return help
    }
}
