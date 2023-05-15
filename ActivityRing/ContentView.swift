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
    func path(in rect: CGRect) -> Path {
        Path { path in
            
        }
    }
    
    
}
/*
 https://www.devtechie.com/community/public/posts/153868-let-s-build-activity-ring-in-swiftui
 */
