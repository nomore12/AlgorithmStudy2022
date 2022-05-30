import Foundation

func solution(_ n:Int64) -> [Int] {
    return String(n).reversed().map { $0.wholeNumberValue! }
    
//    var reverse = [Int64]()
//    var n = n
//    while n > 0 {
//        reverse.append(n % 10)
//        n /= 10
//    }
//
//    return reverse.map { Int($0) }
}