//
//  NewLinkView.swift
//  Crispy
//
//  Created by Linus Skucas on 4/11/22.
//

import SwiftUI

struct NewLinkView: View {
    @State var draftLinkName = ""
    @State var draftLinkURL = ""
    @State var isDraftReady = false
    
    @Binding var isAddingLink: Bool
    
    @EnvironmentObject var crispyVM: CrispyViewModel

    var body: some View {
        Form {
            TextField("Name", text: $draftLinkName)
            TextField("Destination URL", text: $draftLinkURL)
            
            Button("Create Link") {
                addLink()
            }
            .keyboardShortcut(.defaultAction)
            .disabled(!isDraftReady)
        }
        .padding()
        .frame(minWidth: 400, maxHeight: 175)
        .onSubmit {
            addLink()
        }
        .onChange(of: draftLinkName) { newValue in
            checkFields()
        }
        .onChange(of: draftLinkURL) { newValue in
            checkFields()
        }
    }
    
    private func checkFields() {
        if draftLinkName == "" || draftLinkURL == "" {
            isDraftReady = false
            return
        }
        
        guard URL(string: draftLinkURL) != nil else {
            isDraftReady = false
            return
        }
        
        isDraftReady = true
    }
    
    private func addLink() {
        checkFields()
        guard isDraftReady else {
            NSSound.beep()
            return
        }
        crispyVM.newLink(name: draftLinkName, destination: draftLinkURL)
        isAddingLink.toggle()
    }
    
    private func resetFields() {
        draftLinkName = ""
        draftLinkURL = ""
        isDraftReady = false
    }
}
