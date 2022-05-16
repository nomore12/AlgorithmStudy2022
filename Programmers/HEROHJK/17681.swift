import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result = [String]()
    
    zip(arr1, arr2).forEach {
        var password = String($0 | $1, radix: 2)
            .replacingOccurrences(of: "1", with: "#")
            .replacingOccurrences(of: "0", with: " ")
        
        while password.count < n { password = " " + password }
        
        result.append(password)
    }
    
    return result
}