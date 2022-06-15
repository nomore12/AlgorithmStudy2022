# Implementation(구현)
* 머릿속에 있는 알고리즘을 소스코드로 바꾸는 과정
* 문제를 마주쳤을때, 생각하여 해답을 내놓는 과정
* 변수 타입의 최소, 최대 크기를 고려
* 채점시 메모리와 시간을 고려하여, 복잡도를 생각.
* 문항이 긴편이긴 하지만, 고차원적인 사고력을 요구하지는 않는 편.
* 따라서 최대한 빠르게 읽어 알고리즘을 머릿속에서 생각해내는게 중요함.

## 상하좌우

```Swift
func implement1(size: Int, wayString: String) -> String {
    var x = 0
    var y = 0
    for way in wayString.split(separator: " ") {
        switch way {
        case "L" where y > 0: y -= 1
        case "R" where y < size: y += 1
        case "U" where x > 0: x -= 1
        case "D" where x < size: x += 1
        default: break
        }
    }
    
    return "\(x + 1) \(y + 1)"
}
```

## 시각

```Swift
func implement2_1(number: Int) -> Int {
    var count = 0
    for hour in 0 ... number {
        for minute in 0 ..< 60 {
            for second in 0 ..< 60 {
                if hour / 10 == number || hour % 10 == number || hour == number ||
                    minute / 10 == number || minute % 10 == number || minute == number ||
                    second / 10 == number || second % 10 == number || second == number
                {
                    count += 1
                }
            }
        }
    }
    
    return count
}

func implement2_2(number: Int) -> Int {
    var count = 0
    
    for hour in 0 ... number {
        if hour / 10 == number || hour % 10 == number || hour == number {
            count += 3600
            continue
        }
        for minute in 0 ..< 60 {
            if minute / 10 == number || minute % 10 == number || minute == number {
                count += 60
                continue
            }
            for second in 0 ..< 60 {
                if second / 10 == number || second % 10 == number || minute == number {
                    count += 1
                }
            }
        }
    }
    
    return count
}

func implement2_3(number: Int) -> Int {
    var count = 0
    for h in 0 ... number {
        for m in 0 ..< 60 {
            for s in 0 ..< 60 {
                if String(format:"%02i:%02i:%02i", h, m, s).contains("\(number)") { count += 1 }
            }
        }
    }
    
    return count
}
```

## 왕실의 나이트

```Swift
func implement3(_ startPoint: String) -> Int {
    var count = 8
    let startPointCharArray = Array(startPoint) // 입력받은 문자열을 배열 캐릭터로 나눔.
    var points = [Int]()
    
    let max = 7
    
    for point in startPointCharArray {
        // x와 y의 조건이 같기때문에, x, y의 구분은 필요하지 않음. 따라서 2칸의 배열로 처리.
        // 1~8 / A~H 의 좌표계로 되어있지만, 로직은 가로 세로 둘다 0~7을 이용.
        // 해당 캐릭터가 숫자인지 확인 후 숫자라면 숫자로 변환, 아니라면 문자로 변환.
        // 그런데 소문자 a의 아스키코드값은 97이므로, 97을 빼준다. 따라서 a는 0, h는 7이됨.
        points.append(
            point.isWholeNumber ? Int(point.wholeNumberValue!) - 1 : Int(point.asciiValue!) - 97
        )
    }
    
    // 핵심 로직은 이렇게 접근함.
    // "2칸 전진 후 좌우 확인."
    // 2칸 전진이 되지 않는다면, 좌우확인도 되지 않는다. 따라서 좌, 우 1개의 경우의수를 놓치기 때문에, 2칸 전진이 되지 않는다면 2개의 경우의수가 날아간다.
    // 2칸전진이 되는데, 좌측 혹은 우측으로 진입이 되지 않는다면 1개의 경우의수가 날아간다.
    // 4방향이기때문에, 모든 경우의수는 8가지다. 그래서 count를 8에서 빼가는 역계산을 하는 것.
    // 아래 로직은, 주석에 있는 방법을 반복문으로 변환한것이다.
    // if x - 2 < 0 { count -= 2 }
    // if x + 2 > 7 { count -= 2 }
    // if x - 1 < 0 { count -= 1 }
    // if x + 1 > 7 { count -= 1 }
    // if y - 2 < 0 { count -= 2 }
    // .
    // .
    // .
    // if y + 1 > 7 { count -= 1 }
    // 위 코드를 x, y가 아닌 2개의 좌표배열, 그리고 반복문으로 실행하면 이런 로직이 완성된다.
    for point in points {
        for value in 1 ... 2 where point - value < 0 || point + value > max {
            count -= value
        }
    }
    
    return count
}

func implement3_1(_ startPoint: String) -> Int {
    var count = 8
    let startPointCharArray = Array(startPoint) // 입력받은 문자열을 배열 캐릭터로 나눔.
    var points = [Int]()
    
    let max = 7
    
    for point in startPointCharArray {
        points.append(
            point.isWholeNumber ? Int(point.wholeNumberValue!) - 1 : Int(point.asciiValue!) - 97
        )
    }
    
    for point in points {
        for value in 1 ... 2 where point - value < 0 || point + value > max {
            count -= value
        }
    }
    
    return count
}
```

## 게임 개발

```Swift
class CharacterPoint {
    enum Cardinal: Int {
        case n = 0
        case e = 1
        case s = 2
        case w = 3
    }
    
    
    var x = 0
    var y = 0
    var direction = Cardinal.n
    
    init(_ startPoint: String) {
        self.x = Int(startPoint.split(separator: " ")[0])!
        self.y = Int(startPoint.split(separator: " ")[1])!
        self.direction = Cardinal(rawValue: Int(startPoint.split(separator: " ")[2])!)!
    }
    
    func turn() -> Cardinal {
        var value = self.direction.rawValue
        value = value == 0 ? 3 : value - 1
        self.direction = Cardinal(rawValue: value)!
        
        return self.direction
    }
}

func stringsToMap(_ points: [String]) -> [[Int]] {
    var map = [[Int]]()
    
    for point in points {
        var row = [Int]()
        point.split(separator: " ").forEach { row.append(Int($0)!) }
        map.append(row)
    }
    
    return map
}



func implement4(_ size: String, _ startPoint: String, _ points: String...) -> Int {
    var count = 1
    
    let maxX = Int(size.split(separator: " ")[0])!
    let maxY = Int(size.split(separator: " ")[0])!
    
    let point = CharacterPoint(startPoint)
    
    var map = stringsToMap(points)
    
    var directionCount = 0
    
    var target = (0, 0)
    
    while true {
        _ = point.turn()
        directionCount += 1
        target = (point.y, point.x)
        switch point.direction {
        case .n: target.0 -= 1
        case .e: target.1 += 1
        case .s: target.0 += 1
        case .w: target.1 -= 1
        }
        if target.1 >= 0, target.1 < maxX,
           target.0 >= 0, target.0 < maxY {
            if map[target.0][target.1] == 0 {
                map[target.0][target.1] = 2 // 방문지역은 2로 처리
                map[point.y][point.x] = 2 // 현재 지역, 방문이 확정된 지역 둘 다 2로 처리
                point.y = target.0
                point.x = target.1
                count += 1
                directionCount = 0
                continue
            }
        }
        
        if directionCount > 3 { // 4번 다 돌았을때
            target = (point.y, point.x)
            switch point.direction { // 현재 위치에서 뒤로 가기 때문에 역으로 계산
            case .n: target.0 += 1
            case .e: target.1 -= 1
            case .s: target.0 -= 1
            case .w: target.1 += 1
            }
            
            if target.1 > 0, target.1 < maxX,
               target.0 > 0, target.0 < maxY {
                if map[target.0][target.1] == 1{ // 바다면 멈춤
                    break
                } else { // 방문지역이라면 일단 거기로 가봄
                    point.y = target.0
                    point.x = target.1
                    directionCount = 0
                }
            }
        }
    }
    
    return count
}
```