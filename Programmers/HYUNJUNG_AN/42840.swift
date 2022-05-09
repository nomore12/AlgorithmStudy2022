//
//  42840.swift
//  
//
//  Created by 안현정 on 2022/04/29.
//


// MARK: - 모의고사 / 완전탐색
// https://programmers.co.kr/learn/courses/30/lessons/42862

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
  let mathHaters = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
  var countArray: [Int] = []
  var result: [Int] = []
  
  for hater in mathHaters {
    var count = 0
    for aIdx in 0..<answers.count {
      var hIdx = 0

        if aIdx >= hater.count {
        hIdx = aIdx % hater.count
      } else {
        hIdx = aIdx
      }
      
      if hater[hIdx] == answers[aIdx] {
        count += 1
      }
    }
    countArray.append(count)
  }
  
  for idx in 0..<mathHaters.count {

    if countArray[idx] == countArray.max() {
      result.append(idx+1)
    }
  }
  return result
}
