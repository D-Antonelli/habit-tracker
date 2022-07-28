//
//  ContentView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 21/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            // do something
        } label: {
            VStack(spacing: 30) {
                Text("Add your first habit")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.gray)
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
