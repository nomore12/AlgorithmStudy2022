
import Foundation

func solution(_ numbers:[Int]) -> Int {
    var num = 0
    for i in 0 ... 9 {
        if !numbers.contains(i) {
            num += i
        }
    }
    return num
}