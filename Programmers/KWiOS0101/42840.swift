//
//  42840.swift
//  algorithm
//
//  Created by PKW on 2022/04/29.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    // 찍는 방식 패턴 배열 선언
    let first = [1,2,3,4,5]
    let second = [2,1,2,3,2,4,2,5]
    let third = [3,3,1,1,2,2,4,4,5,5]
    
    // 찍는 방식 배열의 카운트를 초기화할 변수 선언
    var firstCount = 0
    var secondCount = 0
    var thirdCount = 0
    
    // answers로 전달받은 문제 수 만큼
    var firstList = [Int]()
    var secondList = [Int]()
    var thirdList = [Int]()
    
    // 맞춘 문제 카운트할 배열 선언
    var countList = Array(repeating: 0, count: 3)
    var result = [Int]()
    
    
    // 문제 수 만큼 찍는 방식 생성
    for _ in 0..<answers.count {
        if firstCount == first.count {
            firstCount = 0
        }
        firstList.append(first[firstCount])
        firstCount += 1
        
        if secondCount == second.count {
            secondCount = 0
        }
        secondList.append(second[secondCount])
        secondCount += 1
        
        if thirdCount == third.count {
            thirdCount = 0
        }
        thirdList.append(third[thirdCount])
        thirdCount += 1
    }

    // 맞춘 문제 카운트
    for i in 0..<answers.count {
        if firstList[i] == answers[i] {
            countList[0] += 1
        }

        if secondList[i] == answers[i] {
            countList[1] += 1
        }

        if thirdList[i] == answers[i] {
            countList[2] += 1
        }
    }
   
    let max = countList.max()
    
    for i in 0..<countList.count {
        if countList[i] == max {
            result.append(i+1)
        }
    }
    
    return result
}
