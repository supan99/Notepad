//
//  UIView+Extension.swift
//  Notepad
//
//  Created by supan on 10/01/24.
//

import Foundation
import SwiftUI

extension View {
    //For showing snack banner in screen
    func banner(data: Binding<BannerData>, show: Bool) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}
