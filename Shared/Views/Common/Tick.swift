//
//  Tick.swift
//  Notepad
//
//  Created by supan on 09/01/24.
//

import Foundation
import SwiftUI


struct Tick: Shape {
    
    
    
    //MARK: Variables
    let scaleFactor: CGFloat
    
    
    //MARK: Functions
    func path(in rect: CGRect) -> Path {
        let cx = rect.midX + 4
        let cy = rect.midY - 3
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.move(to: CGPoint(x: cx - (42 * scaleFactor), y: cy - (4 * scaleFactor)))
        path.addLine(to: CGPoint(x: cx - (scaleFactor * 18), y: cy + (scaleFactor * 28)))
        path.addLine(to: CGPoint(x: cx + (scaleFactor * 40), y: cy - (scaleFactor * 36)))
        
        return path
    }
}


struct Tick_Previews: PreviewProvider {
    static var previews: some View {
        Tick(scaleFactor: 1)
            .stroke(lineWidth: 5)
    }
}
