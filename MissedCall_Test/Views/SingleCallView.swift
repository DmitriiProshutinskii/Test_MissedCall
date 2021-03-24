//
//  SwiftUIView.swift
//  MissedCall_Test
//
//  Created by Физтех.Радио on 24.03.2021.
//

import SwiftUI

struct SingleCallView: View {
    var call: Call
    @State var offset: CGFloat = .zero
    @State var isOpen: Bool = true
    
    var body: some View {
        NavigationView {
        VStack{
            ZStack{
                BusinesNumberView(number: call.businessNumber.number, label: call.businessNumber.label)
                    .offset(y: scrollUpAndDown(height: offset))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset = gesture.translation.height
                            }
                            .onEnded { _ in
                                if self.offset >= 90 {
                                    isOpen = true
                                }
                                else if self.offset <= -90 {
                                    isOpen = false
                                }
                            }
                    )

                    

                PhoneMainSingleView(name: call.client.Name, address: call.client.address, created: call.durationOfCall, isMissed: call.state ?? "missed")
                    .frame(height: 100, alignment: .center)
                    
            }.frame(height: 200, alignment: .center)

            Spacer()
        }.offset(y: -110)
        }.navigationTitle("Missed Call")
        
    }
    
    func scrollUpAndDown(height: CGFloat) -> CGFloat {
        var offset: CGFloat = .zero
        if isOpen {
            if height < 0 {
                offset = (height >= -90) ? height : -90
            }
            else {
                offset = 0
            }
        }
        else {
            if height > 0 {
                offset = height <= 90 ? -90 + height : 0
            }
            else {
                offset = -90
            }
        }
        return offset
    }
}

struct BusinesNumberView : View {
    var number: String
    var label: String
    
    var body: some View {
        
        VStack {
            Rectangle().frame(height: 190).foregroundColor(.white)
            ZStack {
                Rectangle()
                    .frame(height: 130)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                VStack{
                    VStack(alignment: .leading) {
                        Text("Business Number")
                            .font(.footnote)
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .padding(.bottom,2)
                        Text(label)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(number)
                            .font(.callout)
                            .foregroundColor(Color.gray)
                    }.padding(.leading, -30)
                    
                    Rectangle()
                        .frame(width: 20, height: 5, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }

            }

        }
        }
        
        
    }

struct PhoneMainSingleView: View {
    
    var name: String?
    var address: String
    var created: String
    var isMissed: String
    
    let sizeCircle: CGFloat = 70
    let paddingSize: CGFloat = 15
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 150)
                .foregroundColor(.white)
                .offset(y:-30)
            VStack{
                HStack {
                    PhoneCardView(isMissed: isMissed == "missed")
                    VStack(alignment: .leading){
                        if name != nil {
                            Text(name!).font(.title2).fontWeight(.semibold)
                            Text(address).font(.subheadline).fontWeight(.light)
                        }
                        else {
                            Text(address).font(.title2).fontWeight(.semibold)
                        }
                        
                    }.padding(.leading, 15)
                    Spacer()
                }
                HStack{
                    Text(created).font(.callout).fontWeight(.light).multilineTextAlignment(.center).padding(.leading, 15)
                    Spacer()
                }
            }.padding(.leading, paddingSize)
            .padding(.trailing, paddingSize)
        }

    }
}

struct PhoneCardView: View {
    var isMissed: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 70, height: 70, alignment: .center)
                .foregroundColor(.white)
                .shadow(radius: 3)
            Image(systemName: "phone.fill.arrow.down.left")
                .font(.system(size: 40))
                .foregroundColor(isMissed ? .red : .green)
                
        }
    }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleCallView()
//    }
//}
