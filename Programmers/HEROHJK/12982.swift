import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let d = d.sorted()
    var budget = budget
    var i = 0
    while i < d.count && budget - d[i] >= 0 {
        budget -= d[i]
        i += 1
    }
    
    
    return i
}