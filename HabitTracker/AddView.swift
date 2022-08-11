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
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("CREATE")
                        .font(.title)
                    
                    Spacer()
                    HStack(spacing: 30) {
                        Button {
                            // save habit
                        } label: {
                            Text("SAVE")
                                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                .foregroundColor(.black)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white))
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
                                
                                
                            
                        } header: {
                            Text("NAME YOUR HABIT:")
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        
                        
                        Section {
                            Stepper("\(count)", value: $count, in: 1...9999999)
                                .padding()
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                
                            
                        } header: {
                            Text("DEFAULT COUNT:")
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        
                        
                        Section {
                            TextEditor(text: $note)
                                .padding()
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                .frame(height: 150)
                        } header: {
                            Text("NOTES:")
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
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
