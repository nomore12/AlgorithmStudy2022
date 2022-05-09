//
//  42862.swift
//  algorithm
//
//  Created by PKW on 2022/04/27.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {

    var state = Array(repeating: 0, count: n)
    var result = 0
    
    // lost = [1,2,3] reserve = [3,4,5] 일때 [1,2,4,5]
    // Set의 집합연산 메소드중 symmetricDifference를 사용하여 교집합을 제외한 값을 반환
    let students = Set(lost).symmetricDifference(reserve).sorted()
   
    // lost는 -1, reserve는 1 , [-1, -1, 0, 1, 1]
    for i in students {
        if lost.contains(i) {
            state[i-1] = -1
        } else {
            state[i-1] += 1
        }
    }
    
    for (index, value) in state.enumerated() {
        if index == 0 {
            if value == -1 && state[index+1] > 0 {
                state[index+1] = 0
                result += 1
            } else if value >= 0 {
                result += 1
            }
        } else if index == n-1{
            if value == -1 && state[index-1] > 0 {
                state[index-1] = 0
                result += 1
            } else if value >= 0 {
                result += 1
            }
        } else {
            if value >= 0 {
                result += 1
            } else if value == -1 && state[index-1] > 0  {
                state[index-1] = 0
                state[index] = 0
                result += 1
            } else if value == -1 && state[index+1] > 0 {
                state[index+1] = 0
                state[index] = 0
                result += 1
            }
        }
    }

    return result
}

print(solution(5, [2,4], [1,3,5]))
