//
//  ContentView.swift
//  Recipe
//
//  Created by Ravin on 2022/9/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button(action:{})
            {
                Text("button")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)    // the text color
                
            }
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
