import Foundation

let wordsUrl = Bundle.module.url(forResource: "2222", withExtension: "txt")!
let words = try String(contentsOf: wordsUrl).split(separator: "\n")

for word in words {
    print(word)
    try await Task.sleep(nanoseconds: 603_960_400)
}
