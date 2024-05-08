//
//  EmptyState.swift
//  Foodie
//
//  Created by Nasir on 08/11/2023.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: String
    var message: String
    
    var body: some View {
//        ZStack {
//            Color(.systemBackground)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -50)
//        }
        
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is how your message will look like")
}
