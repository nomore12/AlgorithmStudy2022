import Foundation

// MARK: - 키패드 누르기
// https://programmers.co.kr/learn/courses/30/lessons/67256
// MARK: -

func solution(_ numbers:[Int], _ hand:String) -> String {
    /// 왼손과 오른손의 좌표, 튜플로 i와 j를 가지고 있는다.
    var left = (3, 0)
    var right = (3, 2)
    var result = ""
    let hand = String(Array((hand.uppercased()))[0])
    
    for number in numbers {
        if [1, 4, 7].contains(number) { /// 1, 4, 7중 하나라면 왼손으로만 조작, 이후 왼손의 좌표를 옮긴다
            result += "L"
            switch number {
            case 1: left = (0, 0)
            case 4: left = (1, 0)
            case 7: left = (2, 0)
            default: break
            }
        } else if [3, 6, 9].contains(number) { /// 3, 6, 9중 하나라면 오른손으라몬 조작, 이후 오른손의 좌표를 옮긴다
            result += "R"
            switch number {
            case 3: right = (0, 2)
            case 6: right = (1, 2)
            case 9: right = (2, 2)
            default: break
            }
        } else {
            /// 2, 5, 8, 0 이라면 왼손과 오른손의 거리 차이를 잰다
            /// 더 가까운손으로 키패드를 찍은 후, 가까운 손의 좌표를 옮긴다
            switch number { 
            case 2:
                let leftDistance = abs(0 - left.0) + abs(1 - left.1)
                let rightDistance = abs(0 - right.0) + abs(1 - right.1)
                if leftDistance == rightDistance {
                    result += hand
                    if hand == "L" {
                        left = (0, 1)
                    } else {
                        right = (0, 1)
                    }
                } else if leftDistance < rightDistance {
                    result += "L"
                    left = (0, 1)
                } else {
                    result += "R"
                    right = (0, 1)
                }
            case 5:
                let leftDistance = abs(1 - left.0) + abs(1 - left.1)
                let rightDistance = abs(1 - right.0) + abs(1 - right.1)
                if leftDistance == rightDistance {
                    result += hand
                    if hand == "L" {
                        left = (1, 1)
                    } else {
                        right = (1, 1)
                    }
                } else if leftDistance < rightDistance {
                    result += "L"
                    left = (1, 1)
                } else {
                    result += "R"
                    right = (1, 1)
                }
            case 8:
                let leftDistance = abs(2 - left.0) + abs(1 - left.1)
                let rightDistance = abs(2 - right.0) + abs(1 - right.1)
                if leftDistance == rightDistance {
                    result += hand
                    if hand == "L" {
                        left = (2, 1)
                    } else {
                        right = (2, 1)
                    }
                } else if leftDistance < rightDistance {
                    result += "L"
                    left = (2, 1)
                } else {
                    result += "R"
                    right = (2, 1)
                }
            case 0:
                let leftDistance = abs(3 - left.0) + abs(1 - left.1)
                let rightDistance = abs(3 - right.0) + abs(1 - right.1)
                if leftDistance == rightDistance {
                    result += hand
                    if hand == "L" {
                        left = (3, 1)
                    } else {
                        right = (3, 1)
                    }
                } else if leftDistance < rightDistance {
                    result += "L"
                    left = (3, 1)
                } else {
                    result += "R"
                    right = (3, 1)
                }
            default: break
            }
        }
    }
    
    return result
}