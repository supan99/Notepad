//
//  SettingListTitleView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct SettingListTitleView: View {
    //MARK: Struct Variables
    var imageName: String
    var titleName: String
    
    //MARK: EnvironmentObject Variables
    @EnvironmentObject var global: Global
    
    //MARK: Main View
    var body: some View {
        HStack(spacing: CustomSize.size10.resizeFontSize()){
            Image(systemName: imageName)
                .resizable()
                .frame(width: CGFloat(25.0).resizeFontSize(), height: CGFloat(25.0).resizeFontSize())
                .foregroundColor(global.colorAppearance)
            Text(titleName)
                .font(.system(size: CustomSize.size26.resizeFontSize(), weight: .medium))
                .foregroundColor(global.colorAppearance)
        }//: HStack
    }
}

struct SettingListTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SettingListTitleView(imageName: "", titleName: "")
    }
}
