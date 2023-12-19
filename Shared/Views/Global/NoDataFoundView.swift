//
//  NoDataFoundView.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import SwiftUI

struct NoDataFoundView: View {
    @State var title : String = ""
    @State var noDataImage : String = "note.text"
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: noDataImage)
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 40, height: 35)
                .padding(.bottom, 10)
            if (!title.isEmpty) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.gray)
            }
            Spacer()
        }//VSTACK
    }
}

struct NoDataFoundView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataFoundView()
    }
}
