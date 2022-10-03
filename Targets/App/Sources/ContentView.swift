//
//  ContentView.swift
//  App
//
//  Created by Ilya Snakin on 04.10.2022.
//

import SwiftUI
import Stuff

struct ContentView: View {
    var body: some View {
        VStack {
            Image(AppAsset.closeIconCirlcle.name)
            Text("Here, an image")
            
            StuffView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
