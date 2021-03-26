//
//  OpenButtonView.swift
//  Repo Opener
//
//  Created by skg on 3/25/21.
//

import SwiftUI

struct OpenButtonView: View {
    @State private var showingAlert = false
    @State private var errorMessage: String = ""
    @EnvironmentObject var yamlData: YamlData
    @EnvironmentObject var studentNames: Students
    @Environment(\.openURL) var openURL
    var body: some View {
        Button("Open Repos") {
            if studentNames.names.isEmpty {
                errorMessage = "Please insert names to open repos for."
                showingAlert = true
            } else if yamlData.path.isEmpty {
                errorMessage = "Please open a repos.yaml"
                showingAlert = true
            } else if yamlData.repos.count == 0 {
                errorMessage = "Please verify repos.yaml is valid"
                showingAlert = true
            }
            if showingAlert == false {
                printItAll(studentNames: studentNames, yamlData: yamlData, urlOpener: openURL)
            }
         }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Invalid inputs"), message: Text(errorMessage), dismissButton: .default(Text("Got it!")))

        }
    }
}

struct OpenButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OpenButtonView()
    }
}

func printItAll(studentNames: Students, yamlData: YamlData, urlOpener: OpenURLAction) {
    let studentNamesArray: Array = studentNames.names.split(separator: (","))
    
    var cleanedStudentNamesArray: Array<String> = []
    
    studentNamesArray.forEach { name in
        cleanedStudentNamesArray.append(name.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    print(cleanedStudentNamesArray)
    
    for repo in yamlData.repos {
        if cleanedStudentNamesArray.contains(repo.netid) {
            urlOpener(URL(string: "https://github.com/\(repo.repository)/pulls")!)
        }
    }
}
