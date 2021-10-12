//
//  ContentView.swift
//  CatchTheKenny
//
//  Created by Selcuk Baki on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var timeLeft = 10.0
    @State var chosenX = 180
    @State var chosenY = 250
    
    var body: some View {
        VStack{
            Text("Count: ")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Points: \(score)")
            Text("Time Left: \(timeLeft)")
                .frame(alignment: .leading)
                .padding(.bottom, 100)
        Image("panda")
            .resizable()
            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .position(x: CGFloat(chosenX), y: CGFloat(chosenY))
        Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
