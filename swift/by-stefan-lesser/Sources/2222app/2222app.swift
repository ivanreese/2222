import SwiftUI

class _2222AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }
}

@available(macOS 13.0, *)
@main
struct _2222App: App {
    enum GameState { case playing, paused, finished }
    
    let words = {
        if let wordsUrl = Bundle.module.url(forResource: "2222", withExtension: "txt"),
           let words = try? String(contentsOf: wordsUrl).split(separator: "\n") {
            return words
        } else {
            return "Error! trying to load word list.".split(separator: " ")
        }
    }()
    
    @NSApplicationDelegateAdaptor private var appDelegate: _2222AppDelegate
    let timer = Timer.publish(every: 0.6039604, on: .main, in: .common).autoconnect()
    @State var state: GameState = .finished
    @State var index: Int = 0
    
    var word: any StringProtocol {
        switch (state) {
        case .finished: "Start!"
        case .paused:   "Paused"
        case .playing:  words[index]
        }
    }
    
    func tick() {
        if case .playing = state {
            if index < words.count - 1 {
                index += 1
            } else {
                index = 0
                state = .finished
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            Text(word)
                .font(.system(size: 96, weight: .bold))
                .animation(.default)
                .contentTransition(.numericText())
                .onReceive(timer) { _ in tick() }
                .onTapGesture { state = (state == .playing) ? .paused : .playing }
        }
    }
}
