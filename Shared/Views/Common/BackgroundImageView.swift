//
//  BackgroundImageView.swift
//  Notepad
//
//  Created by supan on 20/12/23.
//

import SwiftUI

struct BackgroundImageView: View {
    
    //MARK: Main View
    var body: some View {
        VStack{
            #if os(iOS)
                Image("homeBG")
                    .resizable()
                    .ignoresSafeArea()
            #endif
        }//: VStack
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
