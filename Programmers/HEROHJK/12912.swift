import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    return Int64((min(a, b) ... max(a, b)).reduce(0, +))
}