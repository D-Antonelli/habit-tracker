//
//  Habits.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 28/07/2022.
//

import Foundation

class Habits: ObservableObject {
    @Published var list: [Habit] = []
}
