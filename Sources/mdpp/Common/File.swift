//
//  File.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

final class File {
    static let fileManager = FileManager.default
    
    static func list() -> [String]? {
        return try? fileManager.contentsOfDirectory(atPath: Config.provisioningDirPath)
    }
    
    static func modificationDate(path: String) -> Date? {
        guard let attributes: NSDictionary = try? fileManager.attributesOfItem(atPath: path) as NSDictionary else {
            return nil
        }
        return attributes.fileModificationDate()
    }
    
    static func createFolder(path: String) -> String? {
        do {
            try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            return path
        } catch {
            return nil
        }
    }
    
    static func removeItem(provision: MobileProvision) -> MobileProvision? {
        do {
            try fileManager.removeItem(at: URL(fileURLWithPath: provision.filePath))
            return provision
        } catch {
            return nil
        }
    }
    
    static func moveItem(destinationPath: String, provision: MobileProvision) -> MobileProvision? {
        do {
            try fileManager.moveItem(at: URL(fileURLWithPath: provision.filePath), to: URL(fileURLWithPath: destinationPath))
            return provision
        } catch {
            return nil
        }
    }
}
