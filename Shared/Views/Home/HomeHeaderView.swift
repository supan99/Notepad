//
//  HomeHeaderView.swift
//  Notepad
//
//  Created by supan on 18/12/23.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var isAdded: Bool
    @Binding var editIndex: Int
    
    var body: some View {
        HStack(alignment: .center) {
            Text("Hello, User!")
            Spacer()
            Button {
                isAdded.toggle()
                editIndex = -1
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 24, weight: .semibold))
            }//BUTTON
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.accentColor)
            .rotationEffect(Angle(degrees: isAdded ? 315 : 0))
            .animation(.easeOut(duration: 0.5), value: isAdded)
        }//HSTACK
    }//: body
}

struct HomeHeaderView_Previews: PreviewProvider {
    @State static var isAdded: Bool = false
    @State static var editIndex: Int = -1
    static var previews: some View {
        HomeHeaderView(isAdded: $isAdded, editIndex: $editIndex)
    }
}
