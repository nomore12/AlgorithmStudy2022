import Foundation

func solution(_ nums: [Int]) -> Int {
    var count = 0
    
    for i in 0 ..< nums.count {
        for j in i + 1 ..< nums.count {
            for k in j + 1 ..< nums.count {
                let num = nums[i] + nums[j] + nums[k]
                if isPrimeNumber(num) { count += 1 }
            }
        }
    }
    
    return count
}

func isPrimeNumber(_ number: Int) -> Bool {
    var count = 0
    
    for i in 2 ..< number {
        if number % i == 0 { return false }
    }
    
    return true
}
