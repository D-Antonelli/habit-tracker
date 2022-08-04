//
//  WhiteRoundedRectangleShape.swift
//  HabitTracker
//
//  Created by Derya Antonelli on 04/08/2022.
//

import Foundation
import SwiftUI

struct WhiteRoundedRectangleShape: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.white))
    }
}
