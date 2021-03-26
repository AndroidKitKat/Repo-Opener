//
//  ReposFileView.swift
//  Repo Opener
//
//  Created by skg on 3/25/21.
//

import SwiftUI

struct ReposFileView: View {
    @State private var fileContent = ""
    @State private var showDocumentsPicker = false
    var body: some View {
        VStack {
            Text(fileContent).padding()
            
            Button("Import repos.yaml") {
                showDocumentsPicker = true
            }
        }
        .sheet(isPresented: self.$showDocumentsPicker) {
            DocumentPicker(fileContent: $fileContent)
        }
    }
}

struct ReposFileView_Previews: PreviewProvider {
    static var previews: some View {
        ReposFileView()
    }
}
