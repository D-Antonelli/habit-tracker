//
//  ContentView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 21/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    
    var body: some View {
        if habits.list.isEmpty {
            Button {
                // open add habit sheet
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
        } else {
            Text("List is not empty")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
