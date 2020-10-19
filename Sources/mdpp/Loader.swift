//
//  Root.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

final class Loader {
    init(args: [String]) {
        if args.count < 2 {
            // mdpp
            Action.default()
            return
        }
        selectCommand(args: Array(args.dropFirst()))
    }
    
    private func selectCommand(args: [String]) {
        switch args.first {
        case Command.cleanup.rawValue:
            Action.cleanup(args: args)
        case Command.expired.rawValue:
            Action.expired(args: args)
        case Command.list.rawValue:
            Action.list(args: args)
        case Command.open.rawValue:
            Action.open()
        case Command.search.rawValue:
            Action.search(args: args)
        case Command.version.rawValue:
            Action.version()
        default:
            Action.default()
        }
    }
}
