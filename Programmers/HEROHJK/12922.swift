import Foundation

func solution(_ n:Int) -> String {
    var numbers = [Int]()
    (0 ..< n).forEach { numbers.append($0) }
    return numbers.map { $0 % 2 == 0 ? "수" : "박" }.reduce("", +)
}