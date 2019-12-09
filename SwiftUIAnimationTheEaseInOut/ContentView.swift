//
//  ContentView.swift
//  SwiftUIAnimationTheEaseInOut
//
//  Created by ramil on 09.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var moveOnPath = false
    @State private var rotatePath = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500)
                .scaleEffect(1.2)
            Circle()
                .trim(from: 1/6, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 220, height: 220)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotatePath ? 200 : 160))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear(){
                    self.rotatePath.toggle()
                }
            Circle()
            .stroke(lineWidth: 2)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .offset(x: 86, y: -50)
                .rotationEffect(.degrees(moveOnPath ? 260 : -10))
                .rotation3DEffect(.degrees(0), axis: (x: 902, y: 0, z: 0))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                .onAppear(){
                    self.moveOnPath.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
