//
//  42748.swift
//  
//
//  Created by 안현정 on 2022/04/29.
//


// MARK: - K번째수 / 정렬
// https://programmers.co.kr/learn/courses/30/lessons/42748

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<commands.count {
        var temp = [Int]()
        
        for j in (commands[i][0]-1)...(commands[i][1]-1) {
            temp.append(array[j])
        }
        
        temp = temp.sorted()
        result.append(temp[commands[i][2]-1])
    }
    
    return result
}
