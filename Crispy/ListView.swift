//
//  ListView.swift
//  Crispy
//
//  Created by Linus Skucas on 3/24/22.
//

import SwiftUI

struct ListView: View {
    var links: [Link]
    @State var fake = false
    @EnvironmentObject var crispyVM: CrispyViewModel
    
    var body: some View {
        Table(crispyVM.links) {
            TableColumn("Name", value: \.name)
            TableColumn("Destination") { link in
                Text(link.url.absoluteString)
            }
            TableColumn("Public") { link in
                Toggle(isOn: $fake) {
                    EmptyView()
                }
                .disabled(true)
            }
        }
        .task {
            await crispyVM.refreshLinks()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static let links = [Link(id: 1, name: "Food", description: "Stuff", url: URL(string: "https://google.com")!, isPublic: false), Link(id: 2, name: "sdfg", description: "Stuff", url: URL(string: "https://linus.sh/kytfiyf/ougvo")!, isPublic: true)]
    
    static var previews: some View {
        ListView(links: Self.links)
    }
}
