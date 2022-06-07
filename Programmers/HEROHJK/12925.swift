import Foundation

func solution(_ s:String) -> Int {
    // return Int(s)! <- 이건 알고리즘이라고 볼 수 없다.
    var number = 0
    var s = s
    var minus = false
    while s.count > 0 {
        let char = s.removeFirst()
        if char.isNumber,
           let num = char.wholeNumberValue {
            number = number * 10 + num
        } else if char == "-" {
            minus = true
        }
    }
    
    return minus ? number * -1 : number
}