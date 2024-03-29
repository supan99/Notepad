//
//  SettingCenterView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct SettingCenterView: View {
    //MARK: State Variables
    @State private var showCount = Global().isDisplayTotalCount // declare a binding for the Toggle Display count
    @State private var isSkinsView: Bool = false

    //MARK: Main View
    var body: some View {
        VStack {
            DarkModeView() //: Dark mode View
            LineLimitView() //: LineLimitSetup View
            #if os(iOS)
                ChooseAppearanceView() //: Choose Appearance
            #endif
            DisplayTotalSceneCountView(showCount: $showCount) //: Display total count
            if (showCount) {
                NavigationLink(destination: SkinsListView()) {
                    SelectDisplayCountSkinView()//: Select Display count skins
                }
            }//: End If
        }//: VStack
        .onChange(of: showCount) { newValue in
            Global().isDisplayTotalCount = newValue
        }
    }
}

struct SettingCenterView_Previews: PreviewProvider {
    static var previews: some View {
        SettingCenterView()
    }
}
