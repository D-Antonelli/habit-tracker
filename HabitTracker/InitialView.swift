//
//  InitialView.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 28/07/2022.
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

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(habits: Habits(), showingAddSheet: .constant(false))
    }
}
