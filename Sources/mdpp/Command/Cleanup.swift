//
//  Cleanup.swift
//  mdpp
//
//  Created by keygx on 2017/09/29.
//

import Foundation

final class Cleanup {
    static func execute(option: Command.OptionCleanup) -> [MobileProvision] {
        var provisions = [MobileProvision]()
        
        // Expired
        provisions += Expired.execute(option: Command.OptionReturnList.none)
        // Overlapped
        provisions += Overlapped.execute()
        
        if !provisions.isEmpty {
            provisions = FileListFilter.sorttedByProfileName(provisions: provisions)
            switch option {
            case .delete:
                provisions = delete(provisions: provisions)
            case .move:
                provisions = move(provisions: provisions)
            default: break
            }
        }
        
        return provisions
    }
    
    static func delete(provisions: [MobileProvision]) -> [MobileProvision] {
        var removedProvisions = [MobileProvision]()
        
        for provision in provisions {
            if let removed = File.removeItem(provision: provision) {
                removedProvisions.append(removed)
            }
        }
        
        return removedProvisions
    }
    
    static func move(provisions: [MobileProvision]) -> [MobileProvision] {
        var movedProvisions = [MobileProvision]()
        
        for provision in provisions {
            // /Users/[user]/Desktop/Expired-Profiles-YYYYMMdd-HHmmss
            let directory = "Expired-Profiles-" + Date().toString(dateFormat: Config.destinationDirDateFormat)
            
            guard let destinationPath = File.createFolder(path: Config.desktopDirPath + directory) else {
                return [MobileProvision]()
            }
            
            let fileName = URL(fileURLWithPath: provision.filePath).lastPathComponent
            
            if let moved = File.moveItem(destinationPath: destinationPath + "/" + fileName, provision: provision) {
                movedProvisions.append(moved)
            }
        }
        
        return movedProvisions
    }
}
