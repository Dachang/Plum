//
//  String+GetChar.swift
//  Plum
//
//  Created by 大畅 on 2016/11/29.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import Foundation

extension String {
    
    var strLength: Int {
        return self.characters.count
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(strLength, r.lowerBound)),
                                            upper: min(strLength, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, strLength) ..< strLength)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
}
