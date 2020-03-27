//
//  ContentView.swift
//  SwiftUISummary
//
//  Created by Hailey on 2020/03/27.
//  Copyright © 2020 Hailey. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    //match this Color
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)

    //R:G:B init처럼
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    //In Combine terminology, you're subscribing to the TimeCounter publisher.
    @ObservedObject var timer = TimeCounter()
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff*rDiff+gDiff*gDiff+bDiff*bDiff)
        return Int((1.0-diff*100.0+0.5))
    }

    var body: some View {
        VStack {
            HStack {
                VStack{
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("match this Color")
                }
                VStack {
                    ZStack {
                        Color(red: rGuess, green: gGuess, blue: bGuess)
                        Text(String(timer.counter))
                    }
                    Text("R: \(Int(rGuess * 255.0))  G: \(Int(gGuess * 255.0))  B: \(Int(bGuess * 255.0))")
                }
            }
            Button(action: {
                self.showAlert = true
                self.timer.killTimer()
            }) {
                Text("Hit me")
                    .foregroundColor(.warmBlue)
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("title"), message: Text(String(computeScore())), dismissButton: .cancel())
            }.padding()
            ColorSlider(value: $rGuess, textColor: .red) //keep in sync with rValue
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5).previewLayout(.fixed(width: 337, height: 500))
    }
}

struct ColorSlider: View {
    //ColorSlider
    @Binding var value: Double //
    var textColor : Color // <-
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }.padding(.horizontal)
    }
}

