//
//  NewHabitView.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 4/1/2024.
//

import SwiftUI

struct NewHabitView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Binding var presentNewHabit: Bool
    
    @State var habit:String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField(text: $habit, label: {Text("Habit Name")})
                HStack{
                    Text("Start:")
                    Spacer()
                    Text("\(Date.now.formatted(date: .complete, time: .omitted))")
                }
                HStack{
                    Text("Completion:")
                    Spacer()
                    Text("\(Date.now.addingTimeInterval(60*60*24*30).formatted(date: .complete, time: .omitted))")
                }
                Button("Save"){
                    addChallenge()
                }
            }
            .navigationTitle("Create New Habit")
        }
    }
    
    private func addChallenge() {
        withAnimation {
            let newChallenge = Challenge(name: habit, startDate: Date.now, endDate: Date().addingTimeInterval(60*60*24*30))
            modelContext.insert(newChallenge)
            presentNewHabit = false
        }
    }
}

#Preview {
    NewHabitView(presentNewHabit: .constant(true))
}
