//
//  CreateView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 04/08/2022.
//

import SwiftUI


struct AddView: View {
    @ObservedObject var habits: Habits
    
    @State private var habitName: String = ""
    @State private var count = 1
    @State private var note = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        HStack {
            Text("CREATE")
            Spacer()
            Button {
                habits.add(habit:Habit(name: habitName, count: count, note: note))
                habits.save()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("SAVE")
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "multiply")
            }
        }
        .padding()
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("NAME YOUR HABIT:")
                TextField("Coffee, tea, jogging, etc.", text: $habitName)
            }
            
            VStack(alignment: .leading) {
                Text("DEFAULT COUNT")
                Stepper("\(count)", value: $count, in: 1...9999999)
            }
            
            VStack(alignment: .leading) {
                Text("NOTES:")
                TextEditor(text: $note)
                    .background(.blue)
                    .frame(height: 150)
            }
        }
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
