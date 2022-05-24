import Foundation

func solution(_ s:String) -> Bool {
    return Array(s.lowercased()).filter({ $0 == "p" }).count == Array(s.lowercased()).filter({ $0 == "y" }).count
}