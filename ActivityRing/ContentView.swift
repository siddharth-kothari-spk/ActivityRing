//
//  ContentView.swift
//  ActivityRing
//
//  Created by sidkotha on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct RingPath: Shape {
    var percent: Double
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height / 2), // center will be middle of the rect
                        radius: rect.width / 2, // radius will be half of rect’s width
                        startAngle: Angle(degrees: -90), // startAngle will be -90 degrees so our ring can start from top
                        endAngle: Angle(degrees: ((percent / 100 * 360) + -90)), // endAngle will be computed from percent, and the startAngle value
                        clockwise: false)
            
        }
    }
    
    
}
/*
 https://www.devtechie.com/community/public/posts/153868-let-s-build-activity-ring-in-swiftui
 */
