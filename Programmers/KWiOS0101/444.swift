//
//  main.swift
//  algorithm
//
//  Created by PKW on 2022/04/19.
//

import Foundation

//let numbers = [5,0,2,7]
//let numbers = [2,1,3,4,1]

// #1
//var result = [Int]()
//for i in 0 ..< numbers.count - 1 {
//    for j in i + 1 ..< numbers.count {
//        if !result.contains(numbers[i] + numbers[j]) {
//            result.append(numbers[i] + numbers[j])
//        }
//    }
//}
//print(result.sorted())



// #2
//var st = Set<Int>()
//
//func solution(_ numbers:[Int]) -> [Int] {
//    for i in 0 ..< numbers.count - 1 {
//        print("\(i)번째 숫자 = \(numbers[i])")
//        for j in i + 1 ..< numbers.count {
//            print(numbers[i], numbers[j] ,numbers[i] + numbers[j])
//            st.insert(numbers[i] + numbers[j])
//        }
//    }
//    return st.sorted()
//}

//let a = solution(numbers)
//print(a)

//@discardableResult
//func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
//
//    return [1,2,3,4]
//}
//
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // [유저이름: 인덱스]
    var user = [String: Int]()
    // [신고당한사람: [신고한사람]]
    var reported = [String: [String]]()
    // 이메일 신고 카운트할 빈배열
    var result = Array(repeating: 0, count: id_list.count)
    
    // 유저:인덱스 배열 초기화, 신고당한사람 배열 초기화
    for (index, name) in id_list.enumerated() {
        user[name] = index
        reported[name] = []
    }
    
    // 신고당한사람 : [신고한사람] 배열에 데이터 넣기
    for i in Set(report) {
        let split = i.components(separatedBy: " ")
        reported[split[1]]?.append(contentsOf: [split[0]])
        print(reported)
    }
    
    // 이메일 카운드
    for i in reported where i.value.count >= k {
        i.value.map {
            if let index = id_list.firstIndex(of: $0) {
                result[index] += 1
            }
        }
    }
    return result
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))

//print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))

