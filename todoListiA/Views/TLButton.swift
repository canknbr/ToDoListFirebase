//
//  TLButton.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import SwiftUI

struct TLButton: View {
    var title : String
    var bgColor : Color
    var action : () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)

                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Log In",bgColor: .blue) {
            
        }
    }
}
