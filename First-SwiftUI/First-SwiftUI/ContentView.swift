//
//  ContentView.swift
//  First-SwiftUI
//
//  Created by 张维熙 on 2022/1/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Stay hungry. Stay foolish.").fontWeight(.bold).font(.title)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
