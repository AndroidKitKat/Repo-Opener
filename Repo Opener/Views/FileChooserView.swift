//
//  FileChooserView.swift
//  Repo Opener
//
//  Created by skg on 3/25/21.
//

import SwiftUI
import Yaml

struct FileChooserView: View {
    @EnvironmentObject var yamlData: YamlData
    @State private var yamlPathMessage: String = ""
    var body: some View {
        HStack {
            Button("Choose repos.yaml") {
                let openPanel = NSOpenPanel()
                openPanel.prompt = "Choose file"
                openPanel.allowsMultipleSelection = false
                openPanel.canChooseDirectories = false
                openPanel.canCreateDirectories = false
                openPanel.allowedFileTypes = ["yaml", "yml"]
                openPanel.canChooseFiles = true
                openPanel.begin { (result) -> Void in
                if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    yamlData.path = openPanel.url!.path
                    yamlPathMessage = loadRepoData(yamlFilePath: yamlData.path, yamlData: yamlData)
                    }
                }
            }
            Text(yamlPathMessage)
        }
    }
}

struct FileChooserView_Previews: PreviewProvider {
    static var previews: some View {
        FileChooserView()
    }
}

class repo {
    let netid: String
    let repository: String
    
    init(n: String, r: String) {
        self.netid = n
        self.repository = r
    }
}

func loadRepoData(yamlFilePath: String, yamlData: YamlData) -> String {
    //    guard let yaml = try? Yams.compose(yaml: String(contentsOfFile: yamlFilePath, encoding: .utf8)) else { return }
    let studentArray = try! Yaml.load(String(contentsOfFile: yamlFilePath, encoding: .utf8))
    for student in studentArray.array! {
        let netid = student.dictionary!["netid"] ?? ""
        let repository = student.dictionary!["repository"] ?? ""
        let newRepo = repo(n: netid.string!, r: repository.string!)
        yamlData.repos.append(newRepo)
    }
    return "\(yamlFilePath) loaded"
}
