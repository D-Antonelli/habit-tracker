//
//  Habits.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 28/07/2022.
//

import Foundation

class Habits: ObservableObject {
    @Published var list: [Habit]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedHabits") {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
                list = decoded
                return
            }
        }
        
        list = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(list) {
            UserDefaults.standard.set(encoded, forKey: "SavedHabits")
        }
    }
    
    func delete(habit: Habit) {
        list = list.filter { $0.id != habit.id }
    }
}
