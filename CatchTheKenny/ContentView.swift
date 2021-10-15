//
//  ContentView.swift
//  CatchTheKenny
//
//  Created by Selcuk Baki on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var timeLeft = 10
    @State var positionFinal = CGPoint(x: 80, y: 80)
    @State var showAlert = false

    
    let position1  = CGPoint(x: 80, y: 80)
    let position2  = CGPoint(x: 180, y: 80)
    let position3  = CGPoint(x: 300, y: 80)
    let position4  = CGPoint(x: 80, y: 200)
    let position5  = CGPoint(x: 180, y: 200)
    let position6  = CGPoint(x: 300, y: 200)
    let position7  = CGPoint(x: 80, y: 320)
    let position8  = CGPoint(x: 180, y: 320)
    let position9  = CGPoint(x: 300, y: 320)

    
    
    var counterTimer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            if timeLeft <= 0 {
                showAlert = true
            } else {
                timeLeft -= 1

            }
            
        }
    }
    

    
    var timerClass : Timer {
        
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { _ in
            //
            let positionArray = [position1, position2, position3, position4, position5, position6, position7, position8, position9]
            
            var previousNumber : Int?
            func randomNumberGenerate() -> Int {
                var randomNumber = Int(arc4random_uniform(8))

                if timeLeft > 0 {

                    while previousNumber == randomNumber {
                        randomNumber = Int(arc4random_uniform(8))
                    }
                    previousNumber = randomNumber

                } else {
                    randomNumber = 1
                }

                
                
                return randomNumber
            }
            positionFinal = positionArray[randomNumberGenerate()]
        }
    }
    
    var body: some View {
        VStack{
            Text("Catch the Panda")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Points: \(score)")
            Text("Time Left: \(timeLeft)")
                .frame(alignment: .leading)
                .padding(.bottom, 100)
        Image("panda")
            .resizable()
            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .position(positionFinal)
            .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                score += 1
            })
            .onAppear(perform: {
                timerClass
                counterTimer
            })
        Spacer()
        }.alert(isPresented: $showAlert, content: {
            
            
            return Alert(title: Text("Time Over"), message: Text("Want to play again?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                // OK BUTTON ACTION
                
                score = 0
                timeLeft = 10
                
                
            }), secondaryButton: Alert.Button.cancel())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
