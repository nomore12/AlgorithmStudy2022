//
//  42862.swift
//  
//
//  Created by 안현정 on 2022/04/29.
//

// MARK: - 체육복 / 탐욕법
// https://programmers.co.kr/learn/courses/30/lessons/42862

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lost = lost.sorted(by: <)
    var reserve = reserve.sorted(by: <)
    let elementsForRemove = reserve.filter { lost.contains($0) }
    for i in elementsForRemove {
        lost.remove(at: lost.firstIndex(of: i)!)
        reserve.remove(at: reserve.firstIndex(of: i)!)
    }
    
    var borrowed = [Int]()
    
    for i in lost {
        if reserve.contains(i-1) {
            borrowed.append(i)
            reserve.remove(at: reserve.firstIndex(of: i-1)!)
        } else if reserve.contains(i+1) {
            borrowed.append(i)
            reserve.remove(at: reserve.firstIndex(of: i+1)!)
        }
    }
    
    return n - lost.filter { !borrowed.contains($0) }.count
}
