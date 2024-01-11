//
//  SkinsListView.swift
//  Notepad
//
//  Created by supan on 22/12/23.
//

import SwiftUI

struct SkinsListView: View {
    
    //MARK: Struct Variables
    @State private var arrSkinsList : [Skin] = []
    
    
    //MARK: Main View
    var body: some View {
        ZStack(alignment: .center){
            BackgroundImageView()
            VStack {
                ForEach(0..<arrSkinsList.count, id: \.self) { skinIndex in
                    let skin = arrSkinsList[skinIndex]
                    SkinView(skin, skin.type.skinStyle)
                }
                Spacer()
            }
            .padding(.horizontal, CustomSize.size20.makeZero())
        }
        .onAppear {
            arrSkinsList = Global().skinList
            arrSkinsList = arrSkinsList.map({ skin in
                var data = skin
                data.isSelect = skin.id == Global().skinCode
                return data
            })
        }
    }
    
    //MARK: Custom View
    private func SkinView(_ skin: Skin, _ skinsStyle: SkinStyle) -> some View {
        VStack(alignment: .center){
            HStack(alignment: .center) {
                HStack(spacing: 5){
                    Text("N")
                        .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                        .foregroundColor(ColorConst.titleBlack)
                    HStack(spacing: 8){
                        self.CircleView("9", skinsStyle)
                        self.CircleView("9", skinsStyle)
                        self.CircleView("+", skinsStyle)
                    }
                    Text("tes")
                        .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                        .foregroundColor(ColorConst.titleBlack)
                } //:HStack
                Spacer()
                
                if (skin.isSelect) {
                    Image(systemName: "checkmark")
                        .fontWeight(.semibold)
                }
            }//HSTACK
        }//VSTACK
        .onTapGesture {
            arrSkinsList = arrSkinsList.map({ skinData in
                var skins = skinData
                print(skin.id, skinData.id, skin.id == skinData.id)
                skins.isSelect = skin.id == skinData.id
                return skins
            })
            
            Global().skinCode = skin.id
        }
    }
    
    private func CircleView(_ count: String, _ skinStyle: SkinStyle) -> some View {
        Circle()
            .stroke(skinStyle.strokeColor, lineWidth: CustomSize.size06.resizeFontSize())
            .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
            .overlay {
                    Text(count)
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                        .foregroundColor(skinStyle.textColor)
                }
    }
}

struct SkinsListView_Previews: PreviewProvider {
    static var previews: some View {
        SkinsListView()
    }
}
