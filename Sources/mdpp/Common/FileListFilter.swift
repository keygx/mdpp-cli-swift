//
//  FileListFilter.swift
//  mdpp
//
//  Created by keygx on 2017/10/02.
//

import Foundation

class FileListFilter {
    static func sorttedByProfileName(provisions: [MobileProvision]) -> [MobileProvision] {
        return provisions.sorted { $0.profileName.lowercased() < $1.profileName.lowercased() }
    }
    
    static func overlapped(provisions: [MobileProvision]) -> [String] {
        var filtered = Set<String>()
        var overlapped = Set<String>()
        
        for provision in provisions {
            if !filtered.insert(provision.profileName).inserted {
                overlapped.insert(provision.profileName)
            }
        }
    
        return overlapped.sorted()
    }
    
    static func olderExpirationDate(profileNames: [String]) -> [MobileProvision] {
        var provisions = [MobileProvision]()
        
        for profileName in profileNames {
            let searched = Search.execute(keyword: profileName)
            let sorded = searched.sorted(by: { $1.expiration < $0.expiration })
            provisions += Array(sorded.dropFirst())
        }
        
        return provisions
    }
}
