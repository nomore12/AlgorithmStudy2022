import Foundation

func solution(_ n:Int) -> Int {
    Array(String(n)).map { $0.wholeNumberValue! }.reduce(0, +)
}