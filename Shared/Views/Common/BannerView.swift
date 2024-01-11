//
//  BannerView.swift
//  Notepad
//
//  Created by supan on 10/01/24.
//

import SwiftUI

struct BannerData {
    var title: String
    var detail: String
    var type: BannerType
}

enum BannerType {
    case info
    case warning
    case success
    case error

    var tintColor: Color {
        switch self {
        case .info:
            return Color(red: 67/255, green: 154/255, blue: 215/255)
        case .success:
            return Color.green
        case .warning:
            return Color.yellow
        case .error:
            return Color.red
        }
    }
}

struct BannerModifier: ViewModifier {

    @Binding var data: BannerData
    @State var show: Bool = true

    @State var task: DispatchWorkItem?
    @State var viewOffset: CGFloat = 2
    
    let animationDuration: TimeInterval = 0.3
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                if (value.translation.width < 0) {
                    withAnimation(.easeInOut(duration: animationDuration)){
                        show = true
                        self.viewOffset = -UIScreen.main.bounds.width
                    }
                } else if (value.translation.width > 0) {
                    withAnimation(.easeInOut(duration: animationDuration)){
                        show = true
                        self.viewOffset = UIScreen.main.bounds.width
                    }
                }
        }
    }

    func body(content: Content) -> some View {
        ZStack {
            if (self.show) {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(data.title)
                                .bold()
                            Text(data.detail)
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(data.type.tintColor)
                    .cornerRadius(8)
                    .shadow(radius: 20)
                    Spacer()
                }
                .padding()
                .animation(.easeInOut(duration: 1.2))
                .transition(AnyTransition.move(edge: .leading).combined(with: .opacity))

                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }
                .onAppear {
                    self.task = DispatchWorkItem {
                        withAnimation(.easeInOut(duration: animationDuration)){
                            if (self.show) {
                                self.viewOffset = UIScreen.main.bounds.width
                                show = false
                            }
                        }
                    }
                    // Auto dismiss after 10 seconds, and cancel the task if view disappear before the auto dismiss
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: self.task!)
                }
                .onDisappear {
                    self.task?.cancel()
                }
            }
            content
        }
        .offset(x: viewOffset)
        .gesture(dragGesture)
    }
}
