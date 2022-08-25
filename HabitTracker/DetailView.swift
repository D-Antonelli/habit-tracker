//
//  DetailView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 25/08/2022.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    let habit: Habit
    
    var body: some View {
        List {
            VStack( alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("TOTAL COUNT")
                        .bold()
                    Stepper("\(5) Times", value: .constant(5), in: 1...9999)
                        .frame(maxWidth: 200)
                        .padding()
                        .background(.white)
                        .modifier(WhiteRoundedRectangleShape())
                }
                
                VStack(alignment: .leading) {
                    Text("NOTES")
                        .bold()
                    TextEditor(text: .constant("MY NOTES"))
                        .padding()
                        .background(.white)
                        .modifier(WhiteRoundedRectangleShape())
                        .frame(height: 150)
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
        DetailView(habit: Habit(name: "Drink water", count: 3, note: "2bottles/day"))
    }
}
