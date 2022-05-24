import Foundation

func solution(_ s:String) -> String {
    var newString = ""
    var i = 0
    var start = 0
    let s = Array(s)
    
    while i < s.count {
        let char = s[i]
        
        if char.isLetter {
            newString += (i - start) % 2 == 0 ? String(char.uppercased()) : String(char.lowercased())
        } else if char == " " {
            newString += String(char)
            start = i + 1
        }
        
        i += 1
    }
    
    return newString
}
