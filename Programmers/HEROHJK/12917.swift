import Foundation

func solution(_ s:String) -> String {
    return String(Array(s).sorted(by: { Int(exactly: $0.asciiValue!)! > Int(exactly: $1.asciiValue!)! }))
}