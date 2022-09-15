//
//  CreateView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 04/08/2022.
//

import SwiftUI


struct AddView: View {
    private enum Field: Int, CaseIterable {
        case habit, count, note
    }
    
    @ObservedObject var habits: Habits
    
    @State private var habitName: String = ""
    @State private var count = 1
    @State private var note = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @FocusState private var focusedField: Field?
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("CREATE")
                        .font(.title)
                    
                    Spacer()
                    HStack(spacing: 30) {
                        Button {
                            focusedField = nil
                            habits.add(habit:Habit(name: habitName, count: count, note: note))
                            habits.save()
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("SAVE")
                                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                .foregroundColor(.black)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        }
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
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
                                .focused($focusedField, equals: .habit)
                                
                            
                        } header: {
                            Text("NAME YOUR HABIT:")
                                .foregroundColor(.black)
                              
                        }
                        
                        
                        Section {
                            Stepper("\(count)", value: $count, in: 1...9999999)
                                .padding()
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                .focused($focusedField, equals: .count)
                                .frame(maxWidth: 200)
                                
                            
                        } header: {
                            Text("DEFAULT COUNT:")
                                .foregroundColor(.black)
                            
                        }
                        
                        
                        Section {
                            TextEditor(text: $note)
                                .padding()
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                .frame(height: 150)
                                .focused($focusedField, equals: .note)
                            
                        } header: {
                            Text("NOTES:")
                                .foregroundColor(.black)
                            
                        }

                        
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                }
               
                .listStyle(PlainListStyle())
                
            }

        }
        .padding()
        .background(.darkBackground)
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
