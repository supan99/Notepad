//
//  ChooseAppearanceView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct ChooseAppearanceView: View {
    //MARK: State Variables
    @State private var colorPicker = ColorConst.titleBlack // declare a binding for the Color Appearance
    
    //MARK: EnvironmentObject Variables
    @EnvironmentObject var global: Global
    
    //MARK: Main View
    var body: some View {
        VStack {
            HStack(spacing: 0){
                SettingListTitleView(imageName: "paintpalette", titleName: "Choose Appearance")
                Spacer()
                #if os(iOS)
                ColorPicker("",selection: $colorPicker)
                    .frame(width: 50)
                #endif
            }//: HStack
            .padding(.vertical, CGFloat(10.0).resizeFontSize())
            Divider()
        }//: VStack
        .task {
            colorPicker = global.colorAppearance
        }
        .onChange(of: colorPicker) { newValue in
            global.colorAppearance = newValue
        }
    }
}

struct ChooseAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAppearanceView()
    }
}
