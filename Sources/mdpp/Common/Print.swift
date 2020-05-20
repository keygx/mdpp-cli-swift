//
//  Print.swift
//  mdpp
//
//  Created by keygx on 2017/09/29.
//

import Foundation

final class Print {
    static func f(_ provisions: [MobileProvision]) {
        for provision in provisions {
            stdOutput(text: provisonParamsFormatted(provision: provision))
        }
        
        let formatted = fileCountFormatted(count: provisions.count)
        if !formatted.isEmpty {
            stdOutput(text: formatted)
        }
    }
    
    static func filePath(_ provisions: [MobileProvision]) {
        for provision in provisions {
            stdOutput(text: provision.filePath)
        }
    }
    
    static func provisonParamsFormatted(provision: MobileProvision) -> String {
        let formatted = """
        -------------------------------
        ProfileName:    \(provision.profileName)
        FileName:       \(provision.fileName)
        FilePath:       \(provision.filePath)
        ExpirationDate: \(provision.expiration)
        ModifiedDate:   \(provision.modified)
        
        """
        
        return formatted
    }
    
    static func fileCountFormatted(count: Int) -> String {
        if count < 1 {
            return ""
        }
        
        let formatted = """
        ==> count: \(count)
        
        """
        
        return formatted
    }
    
    static func stdOutput(text: String) {
        print(text)
    }
}
