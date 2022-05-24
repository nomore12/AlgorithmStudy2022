import Foundation

func solution(_ n:Int) -> Int {
    for number in 1 ... n / 2 {
        if n % number == 1 { return number }
    }
    
    return n - 1
}