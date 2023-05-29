//
//  ContentView.swift
//  SwiftUIConbinePlactice5_29
//
//  Created by 橋元雄太郎 on 2023/05/29.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var inputText = ""
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            TextField("Enter text", text: $inputText)
                .onChange(of: inputText) { newValue in
                    viewModel.send(newValue)
                }
            Text(viewModel.outputText)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
