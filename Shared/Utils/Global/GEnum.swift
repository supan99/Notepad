//
//  GEnum.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import Foundation
import SwiftUI

//Font Sizes
enum CustomSize {
    static var size04 = CGFloat(4.0).resizeFontSize()
    static var size06 = CGFloat(6.0).resizeFontSize()
    static var size08 = CGFloat(8.0).resizeFontSize()
    static var size10 = CGFloat(10.0).resizeFontSize()
    static var size12 = CGFloat(12.0).resizeFontSize()
    static var size14 = CGFloat(14.0).resizeFontSize()
    static var size16 = CGFloat(16.0).resizeFontSize()
    static var size18 = CGFloat(18.0).resizeFontSize()
    static var size20 = CGFloat(20.0).resizeFontSize()
    static var size22 = CGFloat(22.0).resizeFontSize()
    static var size24 = CGFloat(24.0).resizeFontSize()
    static var size26 = CGFloat(26.0).resizeFontSize()
    static var size28 = CGFloat(28.0).resizeFontSize()
    static var size30 = CGFloat(30.0).resizeFontSize()
    static var size35 = CGFloat(35.0).resizeFontSize()
    static var size36 = CGFloat(36.0).resizeFontSize()
    static var size38 = CGFloat(38.0).resizeFontSize()
    static var size40 = CGFloat(40.0).resizeFontSize()
}

//Font Style
enum FontStyle {
    static var bebasNeue = "BebasNeues"
}

//Font Colors
enum ColorConst  {
    static var primary = Color(hex: UserDefaults.standard.string(forKey: UserDefaults.Keys.colorAppearance) ?? "E90000")
    static var secondary = Color("AccentColor")
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

//Todo Skins
enum Skins {
    case whiteBGBlackFontBlackStroke
    case whiteBGPrimaryFontBlackStroke
    case blackBGwhiteFontBlackStroke
    case blackBGPrimaryFontBlackStroke
    case whiteBGPrimaryFontPrimaryStroke
    
    var skinStyle : SkinStyle {
        @EnvironmentObject var global: Global
        switch self {
        case .whiteBGBlackFontBlackStroke:
            return SkinStyle(backgroundColor: ColorConst.white, textColor: ColorConst.titleBlack, strokeColor: ColorConst.titleBlack)
        case .whiteBGPrimaryFontBlackStroke:
            return SkinStyle(backgroundColor: ColorConst.white, textColor: Global().colorAppearance, strokeColor: ColorConst.titleBlack)
        case .blackBGwhiteFontBlackStroke:
            return SkinStyle(backgroundColor: ColorConst.titleBlack, textColor: ColorConst.white, strokeColor: ColorConst.titleBlack)
        case .blackBGPrimaryFontBlackStroke:
            return SkinStyle(backgroundColor: ColorConst.titleBlack, textColor: Global().colorAppearance, strokeColor: ColorConst.titleBlack)
        case .whiteBGPrimaryFontPrimaryStroke:
            return SkinStyle(backgroundColor: ColorConst.white, textColor: Global().colorAppearance, strokeColor: Global().colorAppearance)
        }
    }
}


struct SkinStyle {
    var backgroundColor: Color
    var textColor: Color
    var strokeColor: Color
}
