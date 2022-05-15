import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var sum = 0
    (left ... right).forEach {
        sum += primeCountOdd($0) ? $0 * -1 : $0
    }
    return sum
}

func primeCountOdd(_ number: Int) -> Bool {
    var count = 0
    
    (1 ... number).forEach {
        if number % $0 == 0 { count += 1 }
    }
    
    return count % 2 == 1 ? true : false
}