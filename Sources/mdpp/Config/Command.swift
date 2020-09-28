//
//  Command.swift
//  mdpp
//
//  Created by keygx on 2020/05/21.
//

import Foundation

enum Command: String {
    case cleanup = "cleanup"
    case expired = "expired"
    case list    = "list"
    case search  = "search"
    case version = "version"
    
    enum OptionReturnList: String {
        case none = ""
        case path = "--path"
        case json = "--json"
    }
    
    enum OptionCleanup: String {
        case none   = ""
        case delete = "--delete"
        case move   = "--move"
    }
}
