//
//  Action.swift
//  mdpp
//
//  Created by keygx on 2020/05/21.
//

import Foundation

final class Action {
    static func cleanup(args: [String]) {
        if args.count < 2 {
            // mdpp cleanup
            Print.f(Cleanup.execute(option: .delete))
            return
        }
        
        switch args[1] {
        case Command.OptionCleanup.delete.rawValue:
            // mdpp cleanup --delete
            Print.f(Cleanup.execute(option: .delete))
        case Command.OptionCleanup.move.rawValue:
            // mdpp cleanup --move
            Print.f(Cleanup.execute(option: .move))
        default:
            Action.default()
        }
    }
    
    static func expired(args: [String]) {
        if args.count < 2 {
            // mdpp expired
            Print.f(Expired.execute())
            return
        }
        
        switch args[1] {
        case Command.OptionReturnList.path.rawValue:
            // mdpp expired --path
            Print.filePath(Expired.execute())
        case Command.OptionReturnList.json.rawValue:
            // mdpp expired --json
            Print.json(Expired.execute())
            break
        default:
            Action.default()
        }
    }
    
    static func list(args: [String]) {
        if args.count < 2 {
            // mdpp list
            Print.f(List.execute())
            return
        }
        
        switch args[1] {
        case Command.OptionReturnList.path.rawValue:
            // mdpp list --path
            Print.filePath(PathList.execute())
        case Command.OptionReturnList.json.rawValue:
            // mdpp list --json
            Print.json(List.execute())
        default:
            Action.default()
        }
    }
    
    static func open() {
        // open directory
        Print.stdOutput(text: Open.execute())
    }
    
    static func search(args: [String]) {
        if args.count < 2 { return } // mdpp search

        if args.count == 2 {
            // mdpp search [ profile name | keyword ]
            Print.f(Search.execute(keyword: args[1]))
            return
        }
        
        if args.count == 3 && args[2] == Command.OptionReturnList.path.rawValue {
            // mdpp search [ profile name | keyword ] --path
            Print.filePath(Search.execute(keyword: args[1]))
            return
        }
        
        if args.count == 3 && args[2] == Command.OptionReturnList.json.rawValue {
            // mdpp search [ profile name | keyword ] --json
            Print.json(Search.execute(keyword: args[1]))
            return
        }
    }
    
    static func version() {
        // mdpp version
        Print.stdOutput(text: Version.execute())
    }
    
    static func `default`() {
        // mdpp help
        Print.stdOutput(text: Help.execute())
    }
}
