//
//  ListStyleView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 28/07/2022.
//

import SwiftUI

struct ListStyleView: View {
    @ObservedObject var habits: Habits
    @Binding var showingAddSheet: Bool
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.getAll()) { habit in
                    NavigationLink {
                        DetailView(habits: habits, habit: habit)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(habit.name)")
                            Text("COUNT: \(habit.count)")
                        }
                    }
                }
            }
            .navigationTitle("My habits")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }
                }
                
            }
        }
    }
}


struct ListStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ListStyleView(habits: Habits(), showingAddSheet: .constant(false))
    }
}

