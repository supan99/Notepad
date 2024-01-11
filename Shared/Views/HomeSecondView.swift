//
//  TaskRowView.swift
//  
//
//  Created by supan on 09/01/24.
//

import SwiftUI


struct HomeSecondView: View {
    //MARK: Variables
    @State private var txtNotes: String = ""
    @State private var isAdded : Bool = false
    @State private var editIndex : Int = -1
    
    @StateObject var notesManager : NotesManager = NotesManager()
    @State private var viewOffset: CGFloat = 30
    
    private var baseOffset: CGFloat = 30
    private var importantNote: String = """
        \u{2022} You can use the down swipe to add notes.
    
        \u{2022} To add further action to a note, use the right swipe.
    """
    
    //Drag gesture use for the add notes animation gesture.
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                if (value.translation.height >= 100) {
                    isAdded = true
                    viewOffset = baseOffset
                } else if (value.translation.height < 100) {
                    isAdded = false
                    viewOffset = baseOffset
                } else if (value.translation.height <= 0) {
                    isAdded = false
                    viewOffset = baseOffset
                }
            }
            .onChanged { value in
                viewOffset = value.translation.height + 30
            }
    }
    
    
    //MARK: Views
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            BackgroundImageView()
            
            VStack(alignment: .center){
                HomeHeaderView(isAdded: $isAdded, editIndex: $editIndex, noteCount: notesManager.notes.count)
                    .padding(.horizontal, 20)
                    .environmentObject(notesManager)
                
                if (!isAdded && notesManager.notes.count == 0) {
                    NoDataFoundView(title: "No notes found !!! \nSwipe down to add note.")
                } else if (!isAdded) {
                    NotesListView()
                        .environmentObject(notesManager)
                }
            }
            .gesture(dragGesture)
            
            LineView(height: $viewOffset)
                .padding(.horizontal, 26.5)
                .padding(.top, 9)
            
            HStack{}
                .banner(data: .constant(BannerData(title: "Important !!", detail: importantNote, type: .info)), show: true)
        }
    }
}


struct HomeSecondView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSecondView()
    }
}
