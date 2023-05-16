//
//  HeaderView.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import SwiftUI

struct HeaderView: View {
    var angleValue : Double
    var headerColor : Color
    var title : String
    var subTitle : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(headerColor)
                .rotationEffect(Angle(degrees: angleValue))
            
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }.padding(.top,80)
          
        }
        .offset(y:-150)
        .frame(width: UIScreen.main.bounds.width * 3,height: 350)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(angleValue: 15.0, headerColor: .pink,title: "To Do List",subTitle: "Get Things Done")
    }
}
