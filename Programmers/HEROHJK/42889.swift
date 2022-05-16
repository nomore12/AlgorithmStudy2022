import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var fails: [(Int, Float)] = [(Int, Float)]()
    let stages = stages.sorted()
    var i = 0
    var check = 0
    
    (1 ... N).forEach { stage in
        check = i
        while i < stages.count && stages[i] <= stage { i += 1 }
        let stuck = i - check
        let clear = stages.count - check
        fails.append((stage, Float(stuck)/Float(clear)))
    }
    
    return fails.sorted { $0.1 > $1.1 }.map { $0.0 }
}