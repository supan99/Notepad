//
//  SettingFooterView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct SettingFooterView: View {
    
    //MARK: Main View
    var body: some View {
        VStack {
            ContactUSView() //: Contact us
//            TwitterAccountView() //: Twitter
//            LinkedInView() //: LinkedIn
            HelpView() //: Help
            Spacer()
            VersionView() //: Version View
        }
    }
}

struct SettingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SettingFooterView()
    }
}
