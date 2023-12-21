//
//  CenterViewCredits.swift
//  Notepad
//
//  Created by supan on 14/12/23.
//

import SwiftUI

struct CenterViewCredits: View {
    //MARK: Main View
    var body: some View {
        HStack(alignment: .center){
            SeparatorView()
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .renderingMode(.template)
                .frame(width: CGFloat(38).resizeFontSize().resizeFontSize(), height: CGFloat(38).resizeFontSize().resizeFontSize())
            SeparatorView()
        }//: HSTACK
    }//: body
}


//MARK: PREVIEWS
struct CenterViewCredits_Previews: PreviewProvider {
    static var previews: some View {
        CenterViewCredits()
    }
}
