import Foundation

// func solution(_ s:String, _ n:Int) -> String {
//     var s = Array(s)
//     let n = UInt8(n)
    
//     let AInt = Character("A").asciiValue!
//     let ZInt = Character("Z").asciiValue!
//     let aInt = Character("a").asciiValue!
//     let zInt = Character("z").asciiValue!
//     // 대문자 65~90
//     // 소문자 97~122
//     for i in 0 ..< s.count {
//         var code = s[i].asciiValue!
//         if (AInt ... ZInt).contains(code) {
//             code = code + n > ZInt ? AInt + n - (ZInt - code) - 1 : code + n
//             s[i] = Character(UnicodeScalar(code))
//         } else if (aInt ... zInt).contains(code) {
//             code = code + n > zInt ? aInt + n - (zInt - code) - 1 : code + n
//             s[i] = Character(UnicodeScalar(code))
//         }
//     }
//     return String(s)
// }

func solution(_ s:String, _ n:Int) -> String {
    var s = Array(s)
    let n = UInt8(n)
    
    let AInt = Character("A").asciiValue!
    let ZInt = Character("Z").asciiValue!
    let aInt = Character("a").asciiValue!
    let zInt = Character("z").asciiValue!

    for i in 0 ..< s.count {
        var code = s[i].asciiValue!
        if (AInt ... ZInt).contains(code) {
            code = (code + n - AInt) % UInt8((AInt ... ZInt).count) + AInt
        } else if (aInt ... zInt).contains(code) {
            code = (code + n - aInt) % UInt8((aInt ... zInt).count) + aInt
        } else {
            continue
        }
        
        s[i] = Character(UnicodeScalar(code))
    }
    return String(s)
}