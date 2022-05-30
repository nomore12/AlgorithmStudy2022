import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var receive = [(id: String, count: Int)]()
    var reports = [String: Set<String>]()
    
    // 생성 및 등록
    for id in id_list {
        receive.append((id, 0))
        reports[id] = Set<String>()
    }
    
    // 신고 처리
    for voc in report {
        let info = voc.split(separator: " ")
        let repoter = String(info[0])
        let target = String(info[1])
        
        reports[target]?.insert(repoter)
    }
    
    // 필터링
    reports = reports.filter { $0.value.count >= k }
    
    // 발송
    for i in 0 ..< receive.count {
        receive[i].count = reports.filter { $0.value.contains(receive[i].id) }.count
    }
    
    
    return receive.map { $0.count }
}