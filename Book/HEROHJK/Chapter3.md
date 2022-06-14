# Greedy(탐욕법)
* 현재 상황에서 지금 당장 좋은 것만 고르는 방법
* 사전에 외우고 있지 않아도 풀 수 있을 가능성이 높은 문제 유형

간단하게 요약하면, 단순하게 어떤 패턴, 알고리즘 유형등을 도입하지 않고,
당장 생각나는대로 풀어낼 수 있는 알고리즘.

# 문제
## 거스름돈

```Swift
func greedy1(price: Int) {
    let coinTable = [500, 100, 50, 10]
    
    var resultText = ""
    
    var price = price
    
    for coin in coinTable {
        let count = price/coin
        
        resultText += "\(coin)원 \(count)개\n"
        
        price %= coin
    }
    
    print(resultText)
}
```

## 큰 수의 법칙

```Swift
func greedy2_1(input: String, numberString: String) {
    let split = input.components(separatedBy: " ")
    guard split.count > 2 else { return }
    guard var count = Int(split[1]) else { fatalError("count의 유형이 올바르지 않습니다.") }
    guard let consecutive = Int(split[2]) else { fatalError("consecutive의 유형이 올바르지 않습니다.") }

    let numbers: [Int] = numberString.split(separator: " ").compactMap{ Int($0) }.sorted(by: >)
    
    var result = 0
    var i = 0
    
    while count > 0 {
        result += numbers[0]
        count -= 1
        i += 1
        
        if consecutive <= i {
            result += numbers[1]
            count -= 1
            i = 0
        }
    }
    
    print(result)
}
```

## 숫자 카드 게임

```Swift
func greedy3(inputSize: String, cardsString: String...) -> Int {
    var numbers: [Int] = [0]
    cardsString.forEach { numbers.append($0.split(separator: " ").compactMap { Int($0) }.sorted()[0]) }
    return numbers.sorted(by: >)[0]
}
```

## 1이 될 때 까지

```Swift
func greedy4(_ n: Int, _ k: Int) -> Int {
    var n = n
    
    var count = 0
    
    while n >= k {
        if n % k != 0 {
            count += n % k
            n -= n % k
        }
        if n / k > 0 {
            count += 1
            n /= k
        }
    }
    
    count += n - 1
    
    return count
}
```