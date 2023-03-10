//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Jorge Giannotta on 07/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            TabView{
                NumberView()
                    .tabItem {
                        Image(systemName: "number")
                        Text("Guess Number")
                    }
            }
            .accentColor(.orange)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
