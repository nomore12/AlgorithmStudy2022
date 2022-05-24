func solution(_ x:Int) -> Bool {
//    let stringX = String(x)
//
//    let array = Array(stringX)
//
//    let intArray = array.map { $0.wholeNumberValue! }
//
//    let arraySum = intArray.reduce(into: 0, { $0 += $1 })
//
//    if x % arraySum == 0 {
//        return true
//    } else {
//        return true
//    }
    x % String(x).map { $0.wholeNumberValue! }.reduce(into: 0, { $0 += $1 }) == 0
}