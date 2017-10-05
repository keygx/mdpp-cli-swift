//
//  Root.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

class Root {
    init(args: [String]) {
        if args.count < 2 {
            Print.stdOutput(text: Help.execute())
            return
        }
        selectCommand(args: Array(args.dropFirst()))
    }
    
    func selectCommand(args: [String]) {
        switch args.first {
        case Command.cleanup.rawValue?:
            if args.count < 2 {
                Print.f(Cleanup.execute(option: .delete))
                return
            }
            switch args[1] {
            case Command.Option.delete.rawValue:
                Print.f(Cleanup.execute(option: .delete))
            case Command.Option.move.rawValue:
                Print.f(Cleanup.execute(option: .move))
            default:
                Print.stdOutput(text: Help.execute())
            }
        case Command.expired.rawValue?:
            Print.f(Expired.execute())
        case Command.list.rawValue?:
            Print.f(List.execute())
        case Command.search.rawValue?:
            if args.count < 2 { return }
            Print.f(Search.execute(keyword: args[1]))
        case Command.version.rawValue?:
            Print.stdOutput(text: Version.execute())
        default:
            Print.stdOutput(text: Help.execute())
        }
    }
}
