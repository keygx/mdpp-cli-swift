//
//  Overlapped.swift
//  mdpp
//
//  Created by keygx on 2017/10/07.
//

import Foundation

class Overlapped {
    static func execute() -> [MobileProvision] {
        var provisions = [MobileProvision]()
        
        let list = List.execute()
        let overlappedProfileNames = FileListFilter.overlapped(provisions: list)
        
        if !overlappedProfileNames.isEmpty {
            provisions = FileListFilter.olderExpirationDate(profileNames: overlappedProfileNames)
        }
        
        return FileListFilter.sorttedByProfileName(provisions: provisions)
    }
}
