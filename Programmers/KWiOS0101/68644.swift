//
//  68644.swift
//  algorithm
//
//  Created by PKW on 2022/04/29.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
      var st = Set<Int>()
      for i in 0 ..< numbers.count - 1 {
         for j in i + 1 ..< numbers.count {
             st.insert(numbers[i] + numbers[j])
        }
    }
    return st.sorted()
}
