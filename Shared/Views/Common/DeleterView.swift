//
//  DeleterView.swift
//  Notepad
//
//  Created by supan on 09/01/24.
//

import SwiftUI
import UIKit

struct DeleterView: View {
    
    //MARK: State Variables
    @Binding var isDeleting: Bool
    
    let width: CGFloat = UIScreen.main.bounds.width

    //MARK: Main View
    var body: some View {
        ZStack {
            //First Line
            RoundedRectangle(cornerRadius: 2)
                .fill(ColorConst.primary)
            
            
            //Second Line
            RoundedRectangle(cornerRadius: 2)
                .fill(ColorConst.primary)
                .offset(x: 2, y: 3.5)
        }//: ZStack
        .frame(width: isDeleting ? width : 60, height: 2)
        .offset(x: isDeleting ? -width * 1.5 : -12)
        .animation(.easeInOut(duration: 0.6), value: isDeleting)
        .frame(width: 44, height: 44)
    }//: body
}

struct DeleterView_Previews: PreviewProvider {
    static var previews: some View {
        DeleterView(isDeleting: .constant(false))
    }
}

