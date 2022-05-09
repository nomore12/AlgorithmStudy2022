import Foundation

// MARK: - 로또의 최고 순위와 최저 순위
// https://programmers.co.kr/learn/courses/30/lessons/77484
// MARK: -

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    /// 1. lottos에서 0을 제거
    /// 2. 몇개가 지워졌는지 확인 (이게 최저갯수)
    /// 3. 최저 갯수 + lottos에서 지워진 0의 갯수 (이게 최고갯수)
    /// 4. 등수는 7 - 갯수
    
    /// 1
    let lottos = lottos.filter { $0 > 0 }
    
    /// 2
    var min = (Set(win_nums).intersection(lottos)).count
    
    /// 3
    var max = min + (6 - lottos.count)
    
    /// 4
    max = abs(max - 7)
    min = abs(min - 7)
    
    return [max < 7 ? max : 6, min < 7 ? min : 6]
}