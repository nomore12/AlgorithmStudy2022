import Foundation

func solution(_ phone_number:String) -> String {
    String(repeating: "*", count: phone_number.count - 4) + Array(phone_number)[phone_number.count - 4 ..< phone_number.count]
}