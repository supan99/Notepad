//
//  CreditsView.swift
//  Notepad
//
//  Created by supan on 14/12/23.

import SwiftUI

struct CreditsView: View {
    
    //MARK: Environment Variables
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: Main View
    var body: some View {
        ZStack {
            BackgroundImageView()
            VStack(alignment: .center){
                Spacer()
                HeaderViewCredit()
                CenterViewCredits()
                FooterViewCredits()
                Spacer()
            }//: VSTACK
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded({ value in
                if value.translation.width > 150 || value.translation.height > 150 {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }))
    }//: body
}


//MARK: PREVIEWS
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
