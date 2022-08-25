//
//  DetailView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 25/08/2022.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    @ObservedObject var habits: Habits
    let habit: Habit
    
    @State var count: Int
    @State var note: String
   
    
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
                    // save habit
                    Button {
                        habits.list = habits.list.map { item in
                            if(item.id == habit.id) {
                                return Habit(name: habit.name, count: count, note: note)
                            } else {
                                return item
                            }
                        }
                        habits.save()
                    } label: {
                        Text("SAVE")
                            .padding(EdgeInsets(top: 9, leading: 18, bottom: 9, trailing: 18))
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        // delete habit
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
        .padding([.vertical])
        .listStyle(.plain)
        
        .navigationTitle(habit.name)
        .background(.darkBackground)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habits: Habits(), habit: Habit(name: "Drink water", count: 3, note: "2bottles/day"), count: 3, note: "note")
    }
}
