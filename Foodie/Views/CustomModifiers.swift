//
//  CustomModifiers.swift
//  Foodie
//
//  Created by Nasir on 08/11/2023.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
    
}
