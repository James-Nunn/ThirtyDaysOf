//
//  OnboardingView.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 3/1/2024.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    
    
    @Binding var presentWelcome: Bool
    @State var pageIndex = 0
    
    var body: some View {
        TabView(selection: $pageIndex){
            WelcomeView().tag(0)
            ShowHomeView(presentWelcome: $presentWelcome).tag(1)
            
//            More onboarding stuff
//            ContentView()
        }.tabViewStyle(.page)
            .background(Color.blue)
    }
}


#Preview {
    OnboardingView(presentWelcome: .constant(true))
}

struct ShowHomeView: View{
    
    @Binding var presentWelcome: Bool
    
    var body: some View{
        VStack{
            Spacer()
            Text("Add a new Habit with +")
                .font(.title2)
                .foregroundStyle(Color.white)
            Image("home")
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
            Spacer()
            Text("Start Your Journey Now")
                .foregroundStyle(Color.white)
                .font(.title2)
            Spacer()
            Button("Let's Do This"){
                presentWelcome = false
            }
            .padding()
            .background(Color.white)
            .foregroundStyle(Color.blue)
            .clipShape(.capsule)
            
            Spacer()
            
        }.padding()
    }
}
