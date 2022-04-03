//
//  PreferencesView.swift
//  Crispy
//
//  Created by Linus Skucas on 4/2/22.
//

import SwiftUI

struct PreferencesView: View {
    @AppStorage("prefs.url") var apiURL: String = ""
    @AppStorage("prefs.token") var token: String = ""
    
    var body: some View {
        Form {
            TextField("Base API URL", text: $apiURL)
            TextField("Token", text: $token)
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
