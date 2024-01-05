//
//  WelcomeView.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 3/1/2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var animation = false
    
    var body: some View {
            GeometryReader{ geo in
                    VStack{
                        VStack{
                            Spacer()
                            Text("Welcome to")
                                .font(.title)
                                .onAppear{
                                    withAnimation(.easeIn(duration: 1)){
                                        animation.toggle()
                                    }
                                }
                            if animation{
                                Text("30 Days Of")
                                    .font(.largeTitle)
                                    .bold()
                            }
                            Spacer()
                        }
                        .foregroundStyle(Color.white)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    .background(Color.blue)
                }
    }
}

#Preview {
    WelcomeView()
}
