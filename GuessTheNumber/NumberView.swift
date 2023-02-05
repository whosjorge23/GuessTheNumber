//
//  NumberView.swift
//  GuessTheNumber
//
//  Created by Jorge Giannotta on 09/05/21.
//

import SwiftUI

struct NumberView: View {
    @State var display = "Guess The Number"
    @State var buttonName = "Guess"
    @State var randomNumber = Int.random(in: 1..<100)
    @State var attempts = 10
    @State var guessNumber = "" {
        didSet {
            let filtered = guessNumber.filter{$0.isNumber}
            if guessNumber != filtered {
                            guessNumber = filtered
                        }
        }
    }
    var body: some View {
        VStack(alignment: .center, spacing: 10, content: {
            Text("Guess The Number \(randomNumber)")
                .font(.largeTitle)
            Text("Attempts: \(attempts)")
                .font(.title)
            Spacer()
            Text(display)
            TextField("Type a number between 1 and 100", text: $guessNumber)
                .keyboardType(.numberPad)
                .padding()
            Button(action: {
                buttonName = "Guess"
                if attempts == 0 {
                    randomNumber = Int.random(in: 1..<100)
                    attempts = 10
                    display = "You ran out of attempts"
                    buttonName = "Restart"
                }
                else {
                    if guessNumber.isEmpty {
                        display = "Type a number"
                    }else {
                        if  Int(guessNumber)! < randomNumber{
                            display = "Too Low!"
                            guessNumber = ""
                            attempts -= 1
                        }else if  Int(guessNumber)! > randomNumber{
                            display = "Too High!"
                            guessNumber = ""
                            attempts -= 1
                        }else if Int(guessNumber)! == randomNumber {
                            display = "You Guessed The Number: \(randomNumber)"
                            randomNumber = Int.random(in: 1..<100)
                            attempts = 10
                            guessNumber = ""
                            buttonName = "Restart"
                        }
                    }
                }
                
            }, label: {
                Text(buttonName)
            })
            Spacer()
        })
        
    }
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        NumberView()
    }
}
