import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    if x == 0 { return [Int64](repeating: 0, count: n) }
    return stride(from: x, to: x * (n+1), by: x).map { Int64($0) }
}