import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).reduce(into: 0) {
        $0 += $1.0 * $1.1
    }
}