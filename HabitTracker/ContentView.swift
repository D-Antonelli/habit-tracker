//
//  ContentView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 21/07/2022.
//

import SwiftUI

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
            ListStyleView(habits: habits, showingAddSheet: $showingAddSheet).sheet(isPresented: $showingAddSheet) {
                AddView(habits: habits)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
