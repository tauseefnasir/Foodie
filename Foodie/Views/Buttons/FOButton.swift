//
//  FOButton.swift
//  Foodie
//
//  Created by Nasir on 07/11/2023.
//

import SwiftUI

struct FOButton: View {
    
    let  title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .bold()
            .foregroundStyle(.white)
            .frame(width: 220, height: 60)
            .background(.brandPrimary)
            .clipShape(.buttonBorder)
    }
}

#Preview {
    FOButton(title: "Test Button")
}
