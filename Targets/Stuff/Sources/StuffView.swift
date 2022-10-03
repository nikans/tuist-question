//
//  ContentView.swift
//  App
//
//  Created by Ilya Snakin on 04.10.2022.
//

import SwiftUI

public struct StuffView: View {
    public init() {
        
    }
    
    public var body: some View {
        VStack {
//            Image(AppAsset.closeIconCirlcle.name)
            Text("Can't get the image in `Stuff` target (see `StuffView`)")
        }
        .padding()
        .background(Color.red)
    }
}

struct StuffView_Previews: PreviewProvider {
    static var previews: some View {
        StuffView()
    }
}
