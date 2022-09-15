//
//  DetailView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 25/08/2022.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var habits: Habits
    let habit: Habit
    
    @State private var count: Int = 1
    @State private var note: String = ""
    
    
    var body: some View {
        List {
            VStack( alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("TOTAL COUNT")
                        .bold()
                    Stepper("\(count) Times", value: $count, in: 1...9999)
                        .frame(maxWidth: 200)
                        .padding()
                        .background(.white)
                        .modifier(WhiteRoundedRectangleShape())
                }
                
                VStack(alignment: .leading) {
                    Text("NOTES")
                        .bold()
                    TextEditor(text: $note)
                        .padding()
                        .background(.white)
                        .modifier(WhiteRoundedRectangleShape())
                        .frame(height: 150)
                }
                
                
                HStack {
                    Button {
                        habits.update(from: self.habit, to: Habit(name: habit.name, count: count, note: note))
                        habits.save()
                    } label: {
                        Text("SAVE")
                            .padding(EdgeInsets(top: 9, leading: 18, bottom: 9, trailing: 18))
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        habits.delete(habit: habit)
                        habits.save()
                    } label: {
                        Text("DELETE")
                            .padding(EdgeInsets(top: 9, leading: 18, bottom: 9, trailing: 18))
                            .background(.red)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
            
        }
        .onAppear() {
            if let i = habits.list.firstIndex(where: { $0.id == self.habit.id }) {
                self.count = habits.list[i].count
                self.note = habits.list[i].note
            }
        }
        .padding([.vertical])
        .listStyle(.plain)
        .buttonStyle(.borderless)
        
        .navigationTitle(habit.name)
        .background(.darkBackground)
    }
        
        
        
        
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habits: Habits(), habit: Habit(name: "Drink water", count: 3, note: "2bottles/day"))
    }
}
