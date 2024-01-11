//
//  LinkedInView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct LinkedInView: View {
    
    //MARK: Variables
    @EnvironmentObject var global: Global
    
    //MARK: Views
    var body: some View {
        VStack {
            HStack(spacing: 0){
                SettingListTitleView(imageName: "linkedIn", titleName: "supnshah", isSystemImage: false)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .bold))
                    .foregroundColor(global.colorAppearance)
            }//: HStack
            .padding(.vertical, CGFloat(10.0).resizeFontSize())
            Divider()
        }//:VStack
    }
}

struct LinkedInView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedInView()
    }
}
