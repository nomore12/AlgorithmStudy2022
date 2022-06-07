import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    let big = max(n, m)
    let small = min(n, m)
    
    // 최대공약수 계산
    var minimum = small
    while minimum > 1 {
        if big % minimum == 0 && small % minimum == 0 { break }
        minimum -= 1
    }
    
    // 최소공배수 계산
    var maximum = big
    
    while maximum < big * small {
        if maximum % big == 0 && maximum % small == 0 { break }
        maximum += 1
    }
    
    return [minimum, maximum]
}