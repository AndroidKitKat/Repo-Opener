//
//  ContentView.swift
//  Repo Opener
//
//  Created by skg on 3/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HostingWindowFinder { window in
            window?.standardWindowButton(.zoomButton)?.isHidden = true
            window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
        }
        VStack(alignment: .leading) {
            HStack {
                NamesToGradeView()
                OpenButtonView()
            }.padding()
            FileChooserView().padding([.leading, .bottom, .trailing])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HostingWindowFinder: NSViewRepresentable {
    var callback: (NSWindow?) -> ()
    func makeNSView(context: Self.Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async { [weak view] in
            self.callback(view?.window)
        }
        return view
    }
    func updateNSView(_ nsView: NSView, context: Context) {}
}
