//
//  ContentView.swift
//  ViewBuilderPrueba
//
//  Created by Ismael Sabri Pérez on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Container {
                Text("Something")
            }
            KeepCodingButton {
                Text("Something")
            }
            KeepCodingButtonWithIf {
                Text("Something")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
