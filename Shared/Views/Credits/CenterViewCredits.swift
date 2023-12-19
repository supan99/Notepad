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
            Capsule()
                .frame(height: 2)
                .foregroundColor(.accentColor)
            Image(systemName: "note.text")
            Capsule()
                .frame(height: 2)
                .foregroundColor(.accentColor)
        }//: HSTACK
    }//: body
}


//MARK: PREVIEWS
struct CenterViewCredits_Previews: PreviewProvider {
    static var previews: some View {
        CenterViewCredits()
    }
}
