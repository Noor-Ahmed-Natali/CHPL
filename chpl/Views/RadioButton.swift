//
//  RadioButton.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import SwiftUI

struct RadioButton: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void

    var icon: String {
        isSelected ? "circlebadge.fill" : "circlebadge"
    }
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName:icon)
                Text(label)
                    .multilineTextAlignment(.leading)
            }
        }
        .foregroundColor(.black)
    }
}

#Preview {
    RadioButton(label: "Hello", isSelected: false, action: {})
}
