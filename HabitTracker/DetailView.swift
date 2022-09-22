//
//  DetailView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 25/08/2022.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    let habit: Habit
    
    @State private var count: Int = 1
    @State private var note: String = ""
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("TOTAL COUNT")
                Stepper("\(count) Times", value: $count, in: 1...9999)
            }
            
            VStack(alignment: .leading) {
                Text("NOTES")
                TextEditor(text: $note)
                    .frame(height: 150)
            }
            
            HStack {
                Button {
                    habits.update(from: self.habit, to: Habit(name: habit.name, count: count, note: note))
                    habits.save()
                } label: {
                    Text("SAVE")
                }
                
                Button {
                    habits.delete(habit: habit)
                    habits.save()
                    
                    dismiss()
                } label: {
                    Text("DELETE")
                }
            }
        }
                .onAppear() {
                    if let i = habits.list.firstIndex(where: { $0.id == self.habit.id }) {
                        self.count = habits.list[i].count
                        self.note = habits.list[i].note
                    }
                }
                .navigationTitle(habit.name)
    }
}
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView(habits: Habits(), habit: Habit(name: "Drink water", count: 3, note: "2bottles/day"))
        }
    }
