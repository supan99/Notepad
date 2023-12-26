//
//  VersionView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct VersionView: View {
    //MARK: EnvironmentObject Variables
    @EnvironmentObject var global: Global
    
    //MARK: Main View
    var body: some View {
        VStack {
            VStack(spacing: 5){
                Text("Version 1.0")
                    .font(.system(size: CustomSize.size26.resizeFontSize(), weight: .medium))
                    .foregroundColor(global.colorAppearance)
                
                HStack(alignment: .center, spacing: 4){
                    Image(systemName: "c.circle")
                        .font(.system(size: CustomSize.size20.resizeFontSize(), weight: .medium))
                        .foregroundColor(global.colorAppearance)
                    Text("Supan Shah")
                        .font(.system(size: CustomSize.size20.resizeFontSize(), weight: .medium))
                        .foregroundColor(global.colorAppearance)
                }
            }//: VStack
        }//:VStack
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView()
    }
}
