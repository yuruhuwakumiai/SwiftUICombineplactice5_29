//
//  ViewModel.swift
//  SwiftUIConbinePlactice5_29
//
//  Created by 橋元雄太郎 on 2023/05/29.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var outputText = ""

    private let textPublisher = PassthroughSubject<String, Never>()
    private var textSubscriber: AnyCancellable?

    init() {
        textSubscriber = textPublisher
            .debounce(for: .seconds(1.0), scheduler: RunLoop.main)
            .sink { text in
                self.outputText = text
            }
    }

    func send(_ text: String) {
        textPublisher.send(text)
    }
}

