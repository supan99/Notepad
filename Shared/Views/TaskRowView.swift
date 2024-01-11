//
//  TaskRowView.swift
//  Notepad
//
//  Created by supan on 10/01/24.
//

import SwiftUI

struct TaskRowView: View {
    
    //MARK: Variables
    @EnvironmentObject var notesManager: NotesManager
    @ObservedObject var note : Note
    
    @State var viewOffset: CGFloat = 2
    @State var showRemove: Bool = false
    @State var removeRow : Bool = false
    @State private var colorCode: Color = Global().colorAppearance
    @State private var lineLimit: Int = Global().numberOfLines
    
    let index: Int
    let baseOffset: CGFloat = -2
    let deleteOffset: CGFloat = -40
    let animationDuration: TimeInterval = 0.3
    let dragLimit: CGFloat = 30
    
    //Drag gesture for the swipe actions
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                if (value.translation.width < 0) {
                    withAnimation(.easeInOut(duration: animationDuration)){
                        self.viewOffset = deleteOffset
                        showRemove = true
                    }
                } else if (value.translation.width > 0) {
                    withAnimation(.easeInOut(duration: animationDuration)){
                        self.viewOffset = baseOffset
                        showRemove = false
                    }
                }
            }
    }
    
    //MARK: Functions
    
    //Perform the delete animation on the specific row
    func deleteRow() {
        withAnimation(.default) {
            removeRow = true
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(.easeInOut(duration: animationDuration)) {
                viewOffset = -UIScreen.main.bounds.width
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration * 2.5, repeats: false) { _ in
            delete()
        }
    }
    
    //Perform the delete operation on the row
    func delete() {
        notesManager.removeData(note: note)
        removeRow = false
        viewOffset = 2
        showRemove = false
    }
    
    //MARK: Views
    var body: some View {
        ZStack(alignment: .leading) {
            ZStack {
                Color.clear
                
                //Layer 1
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.clear)
                    .offset(x:3, y: 5)
                
                //Layer 2
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.clear)
                
                HStack(spacing: 10) {
                    Text("#\(index)")
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold, design: .monospaced))
                        .foregroundColor(self.colorCode)
                    
                    Text(note.note)
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold, design: .monospaced))
                        .foregroundColor(self.colorCode)
                        .tracking(-0.75)
                        .lineLimit(self.lineLimit == 0 ? nil : self.lineLimit)
                        .animation(.easeInOut(duration: 0.3).delay(0.05), value: note.isComplete)
                        .onTapGesture {
                            notesManager.updateTaskStatus(note: note)
                        }
                        .overlay(alignment: .leading) {
                            Rectangle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(Global().colorAppearance.opacity(0.7))
                                .offset(y: 2)
                                .opacity(note.isComplete ? 1 : 0)
                                .frame(width: note.isComplete ? .none : 0, height: 1)
                                .animation(.default, value: note.isComplete)
                        }
                    Spacer()
                }
                .padding(14)
            }
            .offset(x: viewOffset)
            
            //Swipe right delete button
            HStack {
                Spacer()
                Button {
                    deleteRow()
                } label: {
                    Image(systemName: "multiply")
                        .font(.system(size: CustomSize.size30.resizeFontSize(), weight: .semibold))
                        .foregroundColor(Global().colorAppearance)
                    
                }
                .buttonStyle(.plain)
                .rotationEffect(Angle(degrees: showRemove ? 360 : 0))
                .animation(.easeOut(duration: 0.5), value: showRemove)
                .opacity(showRemove ? 1 : 0)
                .opacity(removeRow ? 0 : 1)
                .offset(x: 48)
                .frame(width: 32, height: 32)
                
                //Strike Through event on task
                DeleterView(isDeleting: $removeRow)
                    .frame(width: 32, height: 32)
                    .opacity(removeRow ? 1 : 0)
                
            }
            .zIndex(4)
            
            //After Delete popup events view
            EmitterView()
                .opacity(removeRow ? 1 : 0)
        }
        .onAppear(){
            self.viewOffset = 2
            self.colorCode = Global().colorAppearance
            self.lineLimit = Global().numberOfLines
        }
        .gesture(dragGesture)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(note: Note(note: "Hello User", isComplete: false), index: 1)
            .environmentObject(NotesManager())
            .fixedSize(horizontal: false, vertical: true)
            .padding(24)
    }
}
