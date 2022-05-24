import Foundation

func solution(_ dartResult:String) -> Int {
    var points = [Int]()
    var dartResult = dartResult
    
    while dartResult.count > 0 {
        var char = dartResult.removeFirst()
        
        if char.isNumber {
            var number = 0
            while char.isNumber {
                number = number * 10 + char.wholeNumberValue!
                char = dartResult.removeFirst()
            }
            points.append(number)
        }
        if char == "S" {
            points[points.count - 1] = Int(pow(Double(points[points.count - 1]), 1))
        }
        
        if char == "D" {
            points[points.count - 1] = Int(pow(Double(points[points.count - 1]), 2))
        }
        
        if char == "T" {
            points[points.count - 1] = Int(pow(Double(points[points.count - 1]), 3))
        }
        
        if char == "*" {
            points[points.count - 1] = points[points.count - 1] * 2
            if (0 ..< points.count).contains(points.count - 2) {
                points[points.count - 2] = points[points.count - 2] * 2
            }
        }
        
        if char == "#" {
            points[points.count - 1] = points[points.count - 1] * (-1)
        }
    }
    
    return points.reduce(0, +)
}