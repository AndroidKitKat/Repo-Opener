//
//  NamesToGrade.swift
//  Repo Opener
//
//  Created by skg on 3/25/21.
//

import SwiftUI


struct NamesToGradeView: View {
    @EnvironmentObject var students: Students
    var body: some View {
        TextField("pbui, dthain, meiseman, ...", text: $students.names)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct NamesToGradeView_Previews: PreviewProvider {
    static var previews: some View {
        NamesToGradeView()
    }
}

