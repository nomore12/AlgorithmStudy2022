import Foundation

func solution(_ num:Int) -> Int {
    var num = num
    var count = 0
    while num > 1 && count < 500 {
        if num % 2 == 0 {
            num /= 2
        } else {
            num = num * 3 + 1
        }
        
        count += 1
    }
    
    return (count == 500 && num != 1) ? -1 : count
}