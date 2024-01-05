//
//  HomeView.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 3/1/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var challenges: [Challenge]
    
    @State var progress: Double = 0
    @State var presentWelcome = true
    @State var presentNewHabit = false
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                VStack{
                    VStack{
                        Text("You're Progress Towards 30 Days of")
                        Text("\(challenges.first?.name ?? "")")
                        .bigBlue()
                    }
                    .medBlue()
                    
                    ZStack{
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color.blue.opacity(0.5), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                            .rotationEffect(.degrees(180))
                        HStack{
                            Text("Day:")
                            Text(String(format: "%.f", progress * 30))
                        }
                        Circle()
                            .trim(from: 0, to: Double(progress) * 0.5)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                            .rotationEffect(.degrees(180))
                            .animation(.easeOut, value: Double(progress) * 0.5)
                    }
                    .frame(height: geo.size.height * 0.5)
                    .padding()
                    VStack{
                        Text(splashText(p: progress))
                            .bigBlue()
                        
                    }.padding(.top, geo.size.height * -0.25)
                    Spacer()
                    List{
                        ForEach(challenges){ c in
                        Text("c.name")
                        }.onDelete(perform: deleteChallenges)
                    }
                }
                .padding()
                .fullScreenCover(isPresented: $presentWelcome, content: {OnboardingView(presentWelcome: $presentWelcome)})
                .fullScreenCover(isPresented: $presentNewHabit, content: {
                    NewHabitView()
                })
                
                .toolbar{
                    ToolbarItem{
                        Button(action: {presentNewHabit = true}, label: {
                            Image(systemName: "plus")
                        })
                    }
                }
            }
        }.onAppear{
            if challenges.isEmpty {
                presentNewHabit = true
            }
        }
    }
    
    private func splashText(p: Double) -> String{
        if p == 1 {
            return "Congratulations!"
        } else if p <= 1/30 {
            return "First Day!"
        } else if p <= 5/30 {
            return "Great Start!"
        } else {
            return "Almost There!"
        }
    }
    
    private func addChallenge() {
        withAnimation {
            let newChallenge = Challenge(name: "Habit", startDate: Date.now, endDate: Date().addingTimeInterval(60*60*24*30))
            modelContext.insert(newChallenge)
        }
    }

    private func deleteChallenges(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(challenges[index])
            }
        }
    }
    
}

#Preview {
    HomeView()
        .modelContainer(for: Challenge.self, inMemory: true)
}
