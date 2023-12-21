//
//  SelectDisplayCountSkinView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct SelectDisplayCountSkinView: View {
    
    //MARK: Main View
    var body: some View {
        VStack{
            HStack(spacing: 0){
                SettingListTitleView(imageName: "", titleName: "Select display count skin")
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .bold))
                    .foregroundColor(ColorConst.primary)
            }//: HStack
            .padding(.vertical, CGFloat(10.0).resizeFontSize())
            Divider()
        }//: VStack
        .onTapGesture {
            print("CA::ED")
        }
    }
}

struct SelectDisplayCountSkinView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDisplayCountSkinView()
    }
}
