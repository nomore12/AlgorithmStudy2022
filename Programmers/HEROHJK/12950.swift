import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    zip(arr1, arr2).forEach { one, other in
        var sum = [Int]()
        zip(one, other).forEach {
            sum.append($0+$1)
        }

        result.append(sum)
    }

    return result
}