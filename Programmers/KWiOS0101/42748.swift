//
//  42748.swift
//  algorithm
//
//  Created by PKW on 2022/04/29.
//

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
   
    // 결과 담을 배열 선언
    var result = Array(repeating: 0, count: commands.count)
    // k번째에 있는 수를 담을 배열 선언
    var sortedArray = [Int]()
    
    // i ~ j까지 index를 구할 변수 선언
    var start = 0
    var end = 0
    
    //
    for index in 0..<commands.count {
        start = commands[index][0] - 1
        end = commands[index][1] - 1
        sortedArray = array[start...end].sorted()
        result[index] = sortedArray[commands[index][2] - 1]
    }
    return result
}
