import Foundation

func solution(_ n:Int64) -> Int64 {
    // 이딴 코드 짜면 좋은소리 못들음.
    // sqrt(Double(n)) == Double(Int(sqrt(Double(n)))) ? Int64(pow(sqrt(Double(n)) + 1, 2)) : -1
    
    let one = sqrt(Double(n))
    let other = Double(Int(one))
    
    var answer: Int64 = -1
    
    if one == other {
        answer = Int64(pow(one + 1, 2))
    }
    
    return answer
}