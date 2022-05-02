import Foundation

// MARK: - 숫자 문자열과 영단어
// https://programmers.co.kr/learn/courses/30/lessons/81301
// MARK: -

func solution(_ s:String) -> Int {
    var s = s
    .replacingOccurrences(of: "zero", with: "0")
    .replacingOccurrences(of: "one", with: "1")
    .replacingOccurrences(of: "two", with: "2")
    .replacingOccurrences(of: "three", with: "3")
    .replacingOccurrences(of: "four", with: "4")
    .replacingOccurrences(of: "five", with: "5")
    .replacingOccurrences(of: "six", with: "6")
    .replacingOccurrences(of: "seven", with: "7")
    .replacingOccurrences(of: "eight", with: "8")
    .replacingOccurrences(of: "nine", with: "9")
    
    
    return Int(s)!
}