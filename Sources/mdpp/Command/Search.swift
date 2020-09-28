//
//  Search.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

final class Search {
    static func execute(keyword: String) -> [MobileProvision] {
        var provisions = [MobileProvision]()
        
        guard let files = File.list() else {
            return provisions
        }
        
        for file in files {
            if !file.contains(Config.provisioningExt) {
                continue
            }
            
            let filePath = Config.provisioningDirPath + file
            let result = ProvisioningProfile.egrep(path: filePath, tag: Tag.name.rawValue)
            
            if !result.lowercased().contains(keyword.lowercased()) {
                continue
            }
            
            let profileName = ProvisioningProfile.search(path: filePath, tag: .name)
            let fileName = URL(fileURLWithPath: filePath).lastPathComponent
            let expirationDateString = ProvisioningProfile.search(path: filePath, tag: .expiration)
            
            guard let expirationDate = expirationDateString.toDate(dateFormat: Config.expirationDateFormat) else {
                continue
            }
            
            guard let modificationDate = File.modificationDate(path: filePath) else {
                continue
            }
            
            provisions.append(MobileProvision(profileName: profileName,
                                              fileName: fileName,
                                              filePath: filePath,
                                              expiration: expirationDate,
                                              modified: modificationDate))
        }
        
        return FileListFilter.sorttedByProfileName(provisions: provisions)
    }
}
