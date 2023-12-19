//
//  HeaderViewCredit.swift
//  Notepad
//
//  Created by supan on 14/12/23.

import SwiftUI

struct HeaderViewCredit: View {
    //MARK: Main View
    var body: some View {
        VStack{
            Image("swiftui")
                .resizable()
                .frame(width: 60, height: 60)
            Text("CREDITS")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.accentColor)
        }//:VSTACK
    }//: Body
}


//MARK:  PREVIEWS
struct HeaderViewCredit_Previews: PreviewProvider {
    static var previews: some View {
        HeaderViewCredit()
    }
}
