//
//  View.swift
//  ThirtyDaysOf
//
//  Created by James Nunn on 4/1/2024.
//

import Foundation
import SwiftUI

extension View {
    func bigBlue() -> some View {
        self.font(.largeTitle)
            .foregroundStyle(Color.blue)
            .bold()
            .multilineTextAlignment(.center)
    }
    
    func medBlue() -> some View {
        self.font(.title3)
            .foregroundStyle(Color.blue)
            .bold()
            .multilineTextAlignment(.center)
    }
}
