//
//  ViewBuilders.swift
//  ViewBuilderPrueba
//
//  Created by Ismael Sabri Pérez on 11/10/22.
//

import SwiftUI

// This structure shows how to create a custom component that will adopt the
// specifications of the closure body.
struct Container <Content: View> : View {
    var content: Content
    var body: some View {
        content // We can specify padding, background...because content is a View
            .padding()
            .background(.green)
            .cornerRadius(10)
    }
    
    // @ViewBuilder allows content to be a closure and produce one view
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}


struct KeepCodingButton <Content: View> : View {
    @Environment(\.colorScheme) var colorScheme
    var content: Content
    var body: some View {
        content
            .padding()
            // This line shows how to use conditionals in a swift built in manner. This is set as counterexample of the KeepCodingButtonWithIf
            // which allows custom built in ifs in the code
            .background( colorScheme == .dark ? .gray : .orange)
            .foregroundColor(.white)
            .cornerRadius(30)
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

// MARK: - Extension to allow conditionals between declarative functions
extension View {
    // This is not a function but a property with closure type. The fact that the closure is the last parameter leads to use this closure
    // as an if alike function: the condition remains in the parenthesis, while the closure containing the code block to perform.
    
    @ViewBuilder func `if` <Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self // The closure has to return some View but the 'if' property is itself a view as i
        }
    }
}

struct KeepCodingButtonWithIf <Content: View> : View {
    @Environment(\.colorScheme) var colorScheme
    var content: Content
    var body: some View {
        content
            .padding()
            .if(colorScheme == .dark) { view in
                view.background(.blue)
            }
            .if(colorScheme == .light) { view in
                view.background(.orange)
            }
            .foregroundColor(.white)
            .cornerRadius(30)
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}


