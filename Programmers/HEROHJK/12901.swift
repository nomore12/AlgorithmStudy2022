func solution(_ a:Int, _ b:Int) -> String {
    let year = 2016
    let month = [
        31,
        (((2016 % 4 == 0) && (2016 % 100 != 0)) || (year % 400 == 0)) ? 29 : 28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31
    ]
    let weekDay = [
        "FRI",
        "SAT",
        "SUN",
        "MON",
        "TUE",
        "WED",
        "THU"
    ]
    
    var sum = b - 1
    
    (0 ..< a - 1).forEach {
        sum += month[$0]
    }
    
    return weekDay[sum % 7]
}