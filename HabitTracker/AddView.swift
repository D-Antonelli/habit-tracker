//
//  CreateView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 04/08/2022.
//

import SwiftUI


struct AddView: View {
    @ObservedObject var habits: Habits
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("CREATE")
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    HStack(spacing: 30) {
                        Button {
                            // save habit
                        } label: {
                            Text("SAVE")
                                .padding(12)
                                .background(.white)
                                .modifier(WhiteRoundedRectangleShape())
                                
                        }
                        
                        Button {
                            // exit screen
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
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
