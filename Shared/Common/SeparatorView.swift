//
//  SeparatorView.swift
//  Notepad
//
//  Created by supan on 20/12/23.
//

import SwiftUI

struct SeparatorView: View {
    
    //MARK: Main View
    var body: some View {
        Capsule()
            .foregroundColor(.accentColor)
            .frame(height: CustomSize.size06.resizeFontSize())
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
