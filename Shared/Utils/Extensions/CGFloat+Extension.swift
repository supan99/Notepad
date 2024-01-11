//
//  CGFloat+Extension.swift
//  Notepad
//
//  Created by supan on 19/12/23.
//

import Foundation


extension CGFloat {
    func resizeFontSize() -> CGFloat {
        #if os(watchOS)
            return self * 0.67
        #else
            return self
        #endif
    }
    
    func makeZero() -> CGFloat{
        #if os(watchOS)
            return 0
        #else
            return self
        #endif
    }
}
