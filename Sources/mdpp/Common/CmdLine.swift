//
//  CmdLine.swift
//  mdpp
//
//  Created by keygx on 2017/09/28.
//

import Foundation

final class CmdLine {
    static func execute(cmd: String, args: [String]) -> String {
        let process: Process = Process()
        let pipe: Pipe = Pipe()
        process.launchPath = cmd
        process.arguments = args
        process.standardOutput = pipe
        process.launch()
        
        return String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: String.Encoding.utf8)!
    }
}
