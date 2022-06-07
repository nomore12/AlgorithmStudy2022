import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    else if n == 2 { return 3 }
    return (1 ... n / 2).filter { n % $0 == 0 }.reduce(n, +)
}

// func solution(_ n: Int) -> Int { n != 0 ? (1...n).filter{n % $0 == 0}.reduce(0){$0 + $1} : 0 }