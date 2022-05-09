import Foundation

// MARK: - 신규 아이디 추천
// https://programmers.co.kr/learn/courses/30/lessons/72410
// MARK: -

func solution(_ new_id:String) -> String {
    /// 1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    let str = new_id.lowercased()
    var newId = ""
    
    /// 2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    /// isLetter <- 알파벳인지 체크, isNumber <- 숫자인지 체크, 그 외 - _ . 체크
    /// 위 조건에 부합하는 문자(character)만 입력
    for ch in str {
        if ch.isLetter || ch.isNumber || ch == "-" || ch == "_" || ch == "." {
            newId = "\(newId)\(ch)"
        }
    }
    
    /// 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    /// ...이든 ..이든 ..을 .으로 바꾸다보면 결국 .으로 통합되게 되어있음
    while newId.contains("..") {
        newId = newId.replacingOccurrences(of: "..", with: ".")
    }
    
    /// 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    /// 문자가 ..a.. <- 이런식으로 2개 이상일 수 있으니 반복으로 처리
    var newIdArr = Array(newId)
    while newIdArr.count > 0, newIdArr[0] == "." {
        newIdArr.remove(at: 0)
    }
    while newIdArr.count > 0, newIdArr.last! == "." {
        _ = newIdArr.popLast()
    }
    
    /// 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if newIdArr.count <= 0 { newIdArr.append("a") }
    
    /// 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
    /// 만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    if newIdArr.count > 15 { newIdArr = Array(newIdArr[0 ..< 15]) }
    while newIdArr.count > 0, newIdArr.last! == "." {
        _ = newIdArr.popLast()
    }
    
    
    /// 7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    while newIdArr.count < 3 {
        newIdArr.append(newIdArr.last!)
    }
    
    return String(newIdArr)
}