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
    
    
    //MARK: Main View
    var body: some View {
        HStack(spacing: CustomSize.size10.resizeFontSize()){
            Image(systemName: imageName)
                .resizable()
                .frame(width: CGFloat(25.0).resizeFontSize(), height: CGFloat(25.0).resizeFontSize())
                .foregroundColor(ColorConst.primary)
            Text(titleName)
                .font(.system(size: CustomSize.size26.resizeFontSize(), weight: .medium))
                .foregroundColor(ColorConst.primary)
            
        }//: HStack
    }
}

struct SettingListTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SettingListTitleView(imageName: "", titleName: "")
    }
}
