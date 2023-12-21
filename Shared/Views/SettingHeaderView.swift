//
//  SettingHeaderView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct SettingHeaderView: View {
    
    //MARK: Functions
    var dismiss : () -> ()
    
    //MARK: Main View
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.system(size: CustomSize.size24.resizeFontSize(),weight: .bold))
                .foregroundColor(ColorConst.titleBlack)
                .onTapGesture {
                    self.dismiss()
                }
            Spacer()
            Text("Settings")
                .font(.system(size: CustomSize.size24.resizeFontSize(),weight: .bold))
                .foregroundColor(ColorConst.titleBlack)
            Spacer()
            Image(systemName: "info.circle")
                .font(.system(size: CustomSize.size24.resizeFontSize(),weight: .bold))
                .foregroundColor(ColorConst.titleBlack)
        }//: HStack
    }
}

struct SettingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingHeaderView(){
            print("Close View Action Called")
        }
    }
}
