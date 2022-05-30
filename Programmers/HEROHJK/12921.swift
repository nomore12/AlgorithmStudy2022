import Foundation

func solution(_ n:Int) -> Int {
    var count = 0
    
    (2 ... n).forEach { number in
        if isPrimeNumber(at: number) { count += 1 }
    }
    
    return count
}

func isPrimeNumber(at: Int) -> Bool {
    let root = Int(sqrt(Double(at)))
    if 2 > root { return true }
    
    for number in 2 ... root {
        if at % number == 0 { return false }
    }
    
    return true
}