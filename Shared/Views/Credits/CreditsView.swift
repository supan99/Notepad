//
//  CreditsView.swift
//  Notepad
//
//  Created by supan on 14/12/23.

import SwiftUI

struct CreditsView: View {
    //MARK: Main View
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            HeaderViewCredit()
            CenterViewCredits()
            FooterViewCredits()
            Spacer()
        }//: VSTACK
    }//: body
}


//MARK: PREVIEWS
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
