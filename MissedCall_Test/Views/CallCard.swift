//
//  CallCard.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import SwiftUI

struct CallCard: View {
    let call: Call
    
    var body: some View {
        ZStack() {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(height: 100, alignment: .center)
                .shadow(radius: 5)
            Info(call: call)
        }.padding(3)
        .padding(.leading, 15)
        .padding(.trailing, 15)
        
    }
}

struct Info: View {
    var call: Call
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "phone.fill.arrow.down.left")
                    .font(.system(size: 40))
                    .padding(.leading, 10)
                    .foregroundColor(call.state == "missed" ? .red : .green)
                VStack(alignment: .leading){
                    if(call.client.Name != nil) {
                        Text(call.client.Name!).font(.headline).fontWeight(.semibold)
                        Text(call.client.address).font(.headline).fontWeight(.light)
                    }
                    else {
                        Text(call.client.address).font(.headline).fontWeight(.semibold).padding(.bottom, 20)
                    }
                }
                Spacer()
            }.frame(height: 70)
            HStack{
                Text(call.durationOfCall)
                    .fontWeight(.light)
                    .italic()
                Spacer()
                Text(call.dateOfCall).fontWeight(.light)
            }
            .font(.callout)
            .foregroundColor(.gray)
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}


