//
//  Repo_OpenerApp.swift
//  Repo Opener
//
//  Created by skg on 3/25/21.
//

import SwiftUI

@main
struct Repo_OpenerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 500, maxWidth: 500, minHeight: 106, maxHeight: 106)
                .environmentObject(Students())
                .environmentObject(YamlData())
        }
    }
}

class Students: ObservableObject {
    @Published var names: String = ""
}

class YamlData: ObservableObject {
    @Published var path: String = ""
    @Published var repos: [repo] = []
}

