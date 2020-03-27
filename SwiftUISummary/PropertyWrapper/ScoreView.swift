//
//  ScoreView.swift
//  SwiftUISummary
//
//  Created by Hailey on 2020/03/27.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Ch7State: View {
    
    @State var name : String = ""
    
    var body: some View {
        TextField("Enter your name", text: $name)
            .multilineTextAlignment(.center)
        
    }
}

struct ScoreView {
    @Binding private var answered: Int // reference  type; only be set during initialization.
    private let questions: Int // value type; be set only when the view is built
    
    init(answered: Binding<Int>, of questions: Int) {
        self._answered = answered
        self.questions = questions
    }
}
