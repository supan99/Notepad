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
    @State private var isSettingsView: Bool = false
    
    //MARK: Main View
    var body: some View {
        HStack {
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: CGFloat(35).resizeFontSize().resizeFontSize(), height: CGFloat(35).resizeFontSize().resizeFontSize())
                    .foregroundColor(.gray)
            }
            
            Spacer()
            Text("\(currentNoteIndex+1)/\(numberOfNotes)")
                .font(.system(size: CustomSize.size28.resizeFontSize(), weight: .semibold))
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: CGFloat(35).resizeFontSize().resizeFontSize(), height: CGFloat(35).resizeFontSize().resizeFontSize())
                .foregroundColor(.gray)
                .onTapGesture {
                    isCreditView.toggle()
                }
                .fullScreenCover(isPresented: $isCreditView) {
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
