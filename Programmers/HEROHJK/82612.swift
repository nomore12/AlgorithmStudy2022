import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var result: Int64 = 0
    var count = count
    while count > 0 {
        result += Int64(count * price)
        count -= 1
    }
    
    return max(result - Int64(money), 0)
}