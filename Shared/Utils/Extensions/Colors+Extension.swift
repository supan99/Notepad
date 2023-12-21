//
//  Colors+Extension.swift
//  Notepad
//
//  Created by supan on 19/12/23.
//

import Foundation
import SwiftUI
import UIKit


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}


enum ColorConst  {
    static var primary = Color("AccentColor")
    static var titleBlack = Color("TextBlack")
    static var white = Color(uiColor: .white)
    static var white10 = Color(uiColor: UIColor(hex: "#FFFFFF10") ?? .white)
    static var white20 = Color(uiColor: UIColor(hex: "#FFFFFF20") ?? .white)
    static var white50 = Color(uiColor: UIColor(hex: "#FFFFFF50") ?? .white)
    static var c2C2F3DFF = Color(uiColor: UIColor(hex: "#2C2F3DFF") ?? .white)
    static var cC4C4C4FF = Color(uiColor: UIColor(hex: "#C4C4C4FF") ?? .white)
    static var c9FA1ACFF = Color(uiColor: UIColor(hex: "#9FA1ACFF") ?? .white)
    static var c595C68FF = Color(uiColor: UIColor(hex: "#595C68FF") ?? .white)
    static var cFFF0D3FF = Color(uiColor: UIColor(hex: "#FFF0D3FF") ?? .white)
    static var cF5F5F5FF = Color(uiColor: UIColor(hex: "#F5F5F5FF") ?? .white)
    static var cFE91B0FF = Color(uiColor: UIColor(hex: "#FE91B0FF") ?? .white)
    static var cFFB835FF = Color(uiColor: UIColor(hex: "#FFB835FF") ?? .white)
    static var c6B6D7AFF = Color(uiColor: UIColor(hex: "#6B6D7AFF") ?? .white)
    static var cFF316BFF = Color(uiColor: UIColor(hex: "#FF316BFF") ?? .white)
    static var c00B2FFFF = Color(uiColor: UIColor(hex: "#00B2FFFF") ?? .white)
    static var cFFEFBAFF = Color(uiColor: UIColor(hex: "#FFEFBAFF") ?? .white)
    static var c979797FF = Color(uiColor: UIColor(hex: "#979797FF") ?? .white)
}
