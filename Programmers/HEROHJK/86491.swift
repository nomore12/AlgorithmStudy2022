import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var wMax = 0
    var hMax = 0
    for size in sizes {
        let sorted = size.sorted{ $0 > $1 }
        if wMax < sorted[0] { wMax = sorted[0] }
        if hMax < sorted[1] { hMax = sorted[1] }
    }
    
    return wMax * hMax
}