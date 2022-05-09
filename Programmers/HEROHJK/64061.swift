import Foundation

// MARK: - 크레인 인형뽑기 게임
// https://programmers.co.kr/learn/courses/30/lessons/64061
// MARK: -

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    /// 1. 뽑아둔 인형을 저장한 공간을 만든다. 인형이 들어있는 최대 경우의 수인, 기계의 x * y지만 Swift는 유동배열이니까 ㄱㅊ
    /// 2. moves만큼 반복한다
    ///   0. 일반적인 좌표계와 Swift 배열의 좌표계는 역순
    ///   1. 인형이 있는데까지 파고 들어간다, 이때 해당 라인에 다 인형이 없다면 pass
    ///   2. 인형을 뽑는다 (board의 숫자를 임시로 담고 0으로 교체)
    ///   3. 저장공간의 마지막 인형이 뽑은 인형과 같다면 없앤다
    ///   4. 없앨 때 카운팅을 한다
    ///   5. 마지막 인형과 뽑은 인형이 다르다면 집어넣는다
    /// 3. 사라진 인형의 갯수를 내뱉는다
    var board = board
    var count = 0
    let depth = board.count
    
    /// 1
    var bag = [Int]()
    
    /// 2
    for move in moves {
        /// 2 - 1
        var i = 0
        while i < depth && board[i][move - 1] == 0 { i += 1 }
        if depth <= i { continue }
        /// 2 - 2
        let tmp = board[i][move - 1]
        board[i][move - 1] = 0
        if let last = bag.last, last == tmp {
            /// 2 - 3
            _ = bag.popLast()
            /// 2 - 4
            count += 2
        } else {
            /// 2 - 5
            bag.append(tmp)
        }
    }
    
    return count
}