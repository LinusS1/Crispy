//
//  ContentView.swift
//  Crispy
//
//  Created by Linus Skucas on 3/24/22.
//

import SwiftUI

struct ContentView: View {
    @State var isAddingLink = false
    
    var body: some View {
        ListView(links: ListView_Previews.links)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isAddingLink.toggle()
                    } label: {
                        Label("New Link", systemImage: "link.badge.plus")
                    }
                    .popover(isPresented: $isAddingLink) {
                        NewLinkView(isAddingLink: $isAddingLink)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
