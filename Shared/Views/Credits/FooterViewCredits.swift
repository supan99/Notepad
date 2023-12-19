//
//  FooterViewCredits.swift
//  Notepad
//
//  Created by supan on 14/12/23.
//

import SwiftUI

struct FooterViewCredits: View {
    //MARK: Main View
    var body: some View {
        VStack(alignment: .center){
            Text("Supan Shah")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.accentColor)
            
            Text("Software Engineer")
                .font(.system(size: 14, weight: .medium))
        }//: VSTACK
    }//: body
}


//MARK: PREVIEWS
struct FooterViewCredits_Previews: PreviewProvider {
    static var previews: some View {
        FooterViewCredits()
    }
}
