//
//  LineView.swift
//  Notepad
//
//  Created by supan on 10/01/24.
//

import SwiftUI

struct LineView: View {
    //MARK: State Variables
    @Binding var height: CGFloat
    @State var colorCode: Color = Global().colorAppearance
    
    //MARK: Main View
    var body: some View {
        HStack {
            //First Line
            RoundedRectangle(cornerRadius: 2)
                .fill(self.colorCode)
                .frame(width: 4.2,height: height)
         Spacer()
        }//: ZStack
        .animation(height == 30 ? .easeOut(duration: 1.5) : .easeIn(duration: 0.1), value: height)
        .frame(width: 4.2, height: height)
        .onAppear {
            self.colorCode = Global().colorAppearance
        }
    }//: body
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(height: .constant(30))
            .padding(.horizontal, 20)
    }
}
