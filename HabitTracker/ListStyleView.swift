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
                ForEach(habits.list) { habit in
                    NavigationLink {
                        // detail view
                    } label: {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(habit.name)")
                                .textCase(.uppercase)
                                .font(.body.bold())
                            Text("COUNT: \(habit.count)")
                                .font(.footnote)
                        }
                    }
                }
                .padding(25)
                .background(Color.darkBackground)
                .modifier(WhiteRoundedRectangleShape())
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
                                showingAddSheet.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.black)
                            }
                        }
        
                    }
        
    }
        .padding()
}
}

struct ListStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ListStyleView(habits: Habits(), showingAddSheet: .constant(false))
    }
}
