//
//  ContentView.swift
//  ActivityRing
//
//  Created by sidkotha on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            RingView(percent: animate ? 100 : 20, ringColor: .pink)
                .frame(width: 200, height: 200)
            RingView(percent: animate ? 100 : 60, ringColor: .green)
                .frame(width: 150, height: 150)
            RingView(percent: animate ? 100 : 10, ringColor: .cyan)
                .frame(width: 100, height: 100)
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                animate.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct RingPath: Shape {
    var percent: Double
    var animatableData: Double {
        get {
            percent
        }
        set {
            percent = newValue
        }
    }
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


struct RingView: View {
    var percent: Double
    var ringColor: Color
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                RingPath(percent: 100)
                    .stroke(style: StrokeStyle(lineWidth: 20))
                    .fill(ringColor.opacity(0.2))
                
                RingPath(percent: percent)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .fill(ringColor)
            }
            .padding()
        }
    }
}
/*
 https://www.devtechie.com/community/public/posts/153868-let-s-build-activity-ring-in-swiftui
 */
