//
//  SeparatorView.swift
//  Notepad
//
//  Created by supan on 20/12/23.
//

import SwiftUI

struct SeparatorView: View {
    //MARK: State Variables
    @State var primaryColor = ColorConst.secondary
    
    //MARK: Main View
    var body: some View {
        Capsule()
            .foregroundColor(primaryColor)
            .frame(height: CustomSize.size06.resizeFontSize())
            .onAppear {
                primaryColor = Global().colorAppearance
            }
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
