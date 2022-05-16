import Foundation

func solution(_ n:Int) -> Int {
    var radix3 = ""
    
    var n = n
    
    while n > 0 {
        radix3 += "\(n % 3)"
        n = n / 3
    }
    
    while radix3.first == "0" { radix3.removeFirst() }
    
    let arr = radix3.reversed()
    
    var sum = 0
    
    for (i, char) in arr.enumerated() {
        sum += (Int(pow(3, Double(i)))) * Int(char.wholeNumberValue!)
    }

    return sum
}