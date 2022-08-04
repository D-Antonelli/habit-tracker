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
    
    var body: some View {
        Group {
            VStack(spacing: 50) {
                HStack {
                    Text("CREATE")
                        .font(.title)
                    
                    Spacer()
                    HStack(spacing: 30) {
                        Button {
                            // save habit
                        } label: {
                            Text("SAVE")
                                .padding(12)
                                .foregroundColor(.black)
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                            
                        }
                        
                        Button {
                            // exit screen
                        } label: {
                            Image(systemName: "multiply")
                                .font(.title2.bold())
                                .foregroundColor(.black)
                        }
                    }
                }
                
                List {
                    Group {
                        Section {
                            TextField("Coffee, tea, jogging, etc.", text: $habitName)
                                .padding()
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                            
                        } header: {
                            Text("NAME YOUR HABIT")
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        
                        
                        Section {
                            TextField("Coffee, tea, jogging, etc.", text: $habitName)
                                .padding()
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                            
                        } header: {
                            Text("DEFAULT COUNT")
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(PlainListStyle())
                
            }
        }
        .padding(25)
        .background(.darkBackground)
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
