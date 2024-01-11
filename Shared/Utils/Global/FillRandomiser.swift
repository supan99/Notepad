//
//  FillRandomiser.swift
//  Notepad
//
//  Created by supan on 09/01/24.
//

import Foundation


enum Fill: String, CaseIterable {
//    case blue
    case violet
    case red
    case orange
    case teal
    case yellow
}

struct FillRandomiser {
    static func getRandomFill() -> Fill {
        let randomValue = Int.random(in: 0..<Fill.allCases.count)
        return Fill.allCases[randomValue]
    }
}
