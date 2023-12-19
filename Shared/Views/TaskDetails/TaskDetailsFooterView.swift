//
//  FooterViewTD.swift
//  DemoWatchApp Watch App
//
//  Created by supan on 14/12/23.

import SwiftUI

struct TaskDetailsFooterView: View {
    
    //MARK: Class Variables
    let numberOfNotes: Int
    let currentNoteIndex : Int
    
    //MARK: Binding Variables
    @State private var isCreditView: Bool = false
    
    //MARK: Main View
    var body: some View {
        HStack {
            Image(systemName: "gear")
                .foregroundColor(.gray)
            Spacer()
            Text("\(currentNoteIndex+1)/\(numberOfNotes)")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "info.circle")
                .foregroundColor(.gray)
                .onTapGesture {
                    isCreditView.toggle()
                }.sheet(isPresented: $isCreditView) {
                    CreditsView()
                }
        }//: HSTACK
        .padding(.horizontal, 20)
    }//: body
}

//MARK: PREVIEWS
struct TaskDetailsFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsFooterView(numberOfNotes: 2, currentNoteIndex: 1)
    }
}
