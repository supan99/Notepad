//
//  GlobalClasses.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import Foundation
import SwiftUI

struct Skin {
    var id : Int
    var type : Skins
    var isSelect : Bool
}

class Global: ObservableObject {
    
    //MARK: Published Variables
    @Published private var lineLimit = UserDefaults.standard.integer(forKey: UserDefaults.Keys.lineLimit)
    @Published private var isDarkMode = UserDefaults.standard.bool(forKey: UserDefaults.Keys.darkMode)
    @Published private var colorCode = Color(hex: UserDefaults.standard.string(forKey: UserDefaults.Keys.colorAppearance) ?? "E90000")
    @Published private var displayTotalCount = UserDefaults.standard.bool(forKey: UserDefaults.Keys.displayTotalCount)
    @Published private var skinCodeIndex = UserDefaults.standard.integer(forKey: UserDefaults.Keys.skinCode)
    @Published private var skinData = [Skin(id: 0, type: .whiteBGBlackFontBlackStroke, isSelect: true),
                                       Skin(id: 1, type: .whiteBGPrimaryFontBlackStroke, isSelect: false),
                                       Skin(id: 2, type: .blackBGwhiteFontBlackStroke, isSelect: false),
                                       Skin(id: 3, type: .blackBGPrimaryFontBlackStroke, isSelect: false),
                                       Skin(id: 4, type: .whiteBGPrimaryFontPrimaryStroke, isSelect: false)
    ]
    
    //MARK: Access Variables
    var numberOfLines: Int {
        get { return lineLimit }
        set (newVal) {
            lineLimit = newVal
            UserDefaults.standard.set(newVal, forKey: UserDefaults.Keys.lineLimit)
        }
    }
    
    var darkMode: Bool {
        get { return isDarkMode }
        set (newVal) {
            UserDefaults.standard.set(newVal, forKey: UserDefaults.Keys.darkMode)
            isDarkMode = darkMode
        }
    }
    
    var colorAppearance: Color {
        get { return  colorCode }
        set (newVal) {
            guard let hexCode = newVal.toHex else { return }
            colorCode = newVal
            UserDefaults.standard.set(hexCode, forKey: UserDefaults.Keys.colorAppearance)
        }
    }
    
    var isDisplayTotalCount: Bool {
        get { return  displayTotalCount }
        set (newVal) {
            displayTotalCount = newVal
            UserDefaults.standard.set(newVal, forKey: UserDefaults.Keys.displayTotalCount)
        }
    }
    
    var skinList: [Skin] {
        get { return  skinData }
        set (newVal) {
            skinData = newVal
        }
    }
    
    var skinCode : Int {
        get { return skinCodeIndex }
        set (newValue) {
            skinCodeIndex = newValue
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Keys.skinCode)
        }
    }
}
