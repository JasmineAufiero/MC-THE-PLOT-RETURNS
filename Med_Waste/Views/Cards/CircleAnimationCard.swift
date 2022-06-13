//
//  CircleAnimationCard.swift
//  Med_Waste
//
//  Created by Irene Fernando on 09/06/22.
//

import SwiftUI

struct CircleAnimationCard: View {
    var percent : Double
    var scale : Double
    var color : String
    
    @State private var percentage: CGFloat = .zero
    
    var body: some View {
        
        Circle()
            .foregroundColor(Color(color)).zIndex(1)
            .overlay(alignment: .center, content: {Text("\(percent)" + "%").foregroundColor(Color(color)).offset(x:180, y: 100)
                  .scaledToFit()
                        
                    .font(.system(size: 40))
            })
//            .overlay(  alignment: .center, content: {Path { path in
//                path.move(to: CGPoint(x: 175, y: 200))
//                path.addLine(to: CGPoint(x: 175, y: 350))
                //                path.addLine(to: CGPoint(x: 0, y: 300))
//            }
//            .trim(from: 0, to: percentage) // << breaks path by parts, animatable
//            .stroke(Color(color), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .animation(.easeOut(duration: 2.0))
//            .onAppear {
//                self.percentage = 1.0
//                 // << activates animation for 0 to the end
//            }
        
//            .overlay(alignment: .center, content: {Text("\(percent)" + "%").foregroundColor(.black).offset(x:0, y: 250).font(.system(size: 40))})
        .scaleEffect(scale, anchor: .leading)
    
        
    }
}

struct CircleAnimationCard_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimationCard(percent: 20.0, scale: 0.6, color: "DarkBlue")
    }
}
