import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let arr = arr.sorted().filter{ $0 % divisor == 0 }
    return arr.count == 0 ? [ -1 ] : arr
}