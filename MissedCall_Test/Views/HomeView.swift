//
//  CallsView.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var callsMV = CallsViewModel()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.callsMV.isLoading, error: self.callsMV.error) {
                self.callsMV.loadCalls()
            }
            
            if (callsMV.calls != nil) {
                    CallListView(title: "Missed Calls", calls: callsMV.calls!)
                
            }
        }.onAppear {
            self.callsMV.loadCalls()
        }
    }
}



struct CallsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
