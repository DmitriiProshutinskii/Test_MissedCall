//
//  SingleCallView.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import SwiftUI

struct CallListView: View {
    var title: String
    let calls: [Call]

    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                   VStack {
                    ForEach(calls) {call in
                        NavigationLink(destination: SingleCallView(call: call)) {
                         CallCard(call: call)
                        }.buttonStyle(PlainButtonStyle())
                        .navigationTitle("Missed Calls")
                    }
                   }
               }
        }
    }
}
