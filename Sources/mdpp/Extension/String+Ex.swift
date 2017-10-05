//
//  String+Ex.swift
//  mdpp
//
//  Created by keygx on 2017/09/29.
//

import Foundation

extension String {
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
    }
}
