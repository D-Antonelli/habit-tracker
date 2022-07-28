//
//  Habit.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 28/07/2022.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    let name: String
    let count: Int
    let note: String
}
