//
//  ContentView.swift
//  Crispy
//
//  Created by Linus Skucas on 3/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListView(links: ListView_Previews.links)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
