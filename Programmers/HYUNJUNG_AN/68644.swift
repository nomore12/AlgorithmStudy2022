//
//  68644.swift
//  
//
//  Created by 안현정 on 2022/04/29.
//


// MARK: - 두 개 뽑아서 더하기
// https://programmers.co.kr/learn/courses/30/lessons/68644


import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    //중복된 값을 허용하지않는 set 이용
    var answer = Set<Int>()
    
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            answer.insert(numbers[i]+numbers[j])
        }
    }
    
    //오름차순 정렬
    return Array(answer).sorted()
}


