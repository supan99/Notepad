//
//  HomeHeaderView.swift
//  Notepad
//
//  Created by supan on 18/12/23.
//

import SwiftUI
import Combine

struct HomeHeaderView: View {
    @Binding var isAdded: Bool
    @Binding var editIndex: Int
    @Binding var notesCount : Int
    
    private func getCountValue(_ taskNumber: Int) -> String {
        return (taskNumber <= 9) ?  taskNumber.description  : "+"
    }
    
    private func makeStringUsingNoteNumber() {
        var count = notesCount.description
        if (notesCount.description.count > 3) {
            count = "999"
        } else if (notesCount.description.count == 2) {
            count = "0"+count.description
        } else if (notesCount.description.count == 1) {
            count = "00"+count.description
        }
        
        print("COUNT ====> ", count)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: 0){
                Text("N")
                    .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                    .foregroundColor(ColorConst.titleBlack)
                Circle()
                    .stroke(ColorConst.primary, lineWidth: 5)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Text(self.getCountValue(9))
                            .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                            .foregroundColor(ColorConst.titleBlack)
                }
                Circle()
                    .stroke(ColorConst.primary, lineWidth: 5)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Text(self.getCountValue(9))
                            .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                            .foregroundColor(ColorConst.titleBlack)
                }
                Circle()
                    .stroke(ColorConst.primary, lineWidth: 5)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Text(self.getCountValue(10))
                            .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                            .foregroundColor(ColorConst.titleBlack)
                }
                Text("TES")
                    .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                    .foregroundColor(ColorConst.titleBlack)
            } //:HStack
            Spacer()
            Button {
                isAdded.toggle()
                editIndex = -1
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: CustomSize.size35.resizeFontSize(), weight: .semibold))
            }//BUTTON
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(ColorConst.primary)
            .rotationEffect(Angle(degrees: isAdded ? 315 : 0))
            .animation(.easeOut(duration: 0.5), value: isAdded)
        }//HSTACK
        .task {
            self.makeStringUsingNoteNumber()
        }
    }//: body
}

struct HomeHeaderView_Previews: PreviewProvider {
    @State static var isAdded: Bool = false
    @State static var editIndex: Int = -1
    @State static var notesCount: Int = 1000
    static var previews: some View {
        HomeHeaderView(isAdded: $isAdded, editIndex: $editIndex, notesCount: $notesCount)
    }
}
