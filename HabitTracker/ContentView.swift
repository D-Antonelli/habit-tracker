//
//  ContentView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 21/07/2022.
//

import SwiftUI

struct InitialView: View {
    @ObservedObject var habits: Habits
    @Binding var showingAddSheet: Bool
    
    var body: some View {
        Button {
            showingAddSheet.toggle()
        } label: {
            VStack(spacing: 30) {
                Text("Tap to add your first habit")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

struct AddView: View {
    @ObservedObject var habits: Habits
    
    var body: some View {
        Button {
            habits.list.append(Habit(name: "Drink Water", count: 1, note: "Everyday"))
            habits.save()
        } label: {
            Text("Add new")
        }
    }
}

struct ContentView: View {
    @StateObject var habits = Habits()
    
    @State private var showingAddSheet = false
    
    var body: some View {
        if habits.list.isEmpty {
            InitialView(habits: habits, showingAddSheet: $showingAddSheet)
                .sheet(isPresented: $showingAddSheet) {
                    AddView(habits: habits)
                }
        } else {
            NavigationView {
                List {
                    ForEach(habits.list) { habit in
                        NavigationLink {
                            Text("Detail for \(habit.name)")
                        } label: {
                            Group {
                                Text("\(habit.name)")
                                    .font(.title)
                            }
                        }
                    }
                    .padding(25)
                    .background(Color.darkBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.white))
                    .listRowSeparator(.hidden)
                    
                    
                }
                
                .listStyle(.plain)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("My habits")
                            .font(.title)
                            .accessibilityAddTraits(.isHeader)
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            // add sheet
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                        }
                    }
                    
                }
            }
            .padding()
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
