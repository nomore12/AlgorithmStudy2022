import Foundation

func solution(_ n:Int64) -> Int64 {
    Int64(String(n).sorted(by: >).map { $0.wholeNumberValue! }.reduce(into: 0, { $0 = $0 * 10 + $1 }))
}