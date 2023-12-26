//
//  HomeCircleView.swift
//  Notepad
//
//  Created by supan on 22/12/23.
//

import SwiftUI

struct HomeCircleView: View {
    //MARK: Struct Variables
    var count: String
    
    //MARK: State Variables
    @State private var showDisplay : Bool = false
    @State private var skin : Skin = Global().skinList[Global().skinCode]
    
    var body: some View {
        Circle()
            .stroke(skin.type.skinStyle.strokeColor, lineWidth: CustomSize.size06.resizeFontSize())
            .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
            .overlay {
                if (showDisplay) {
                    Text(count)
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                        .foregroundColor(skin.type.skinStyle.textColor)
                }
            }
            .onAppear {
                skin = Global().skinList[Global().skinCode]
                showDisplay = Global().isDisplayTotalCount
            }
    }
}

struct HomeCircleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCircleView(count: "5")
    }
}
