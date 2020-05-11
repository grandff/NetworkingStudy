//: [Previous](@previous)

import Foundation

enum EncodingError : Error{
    case unknown
    case invalidRange
}

struct Employee : Codable{
    var name : String
    var age : Int
    var address : String?
    
    // custom encoding 구현
    // 인코딩 시점에 검증 또는 제약을 추가하거나 직접 인코딩을 구현하는 경우에는 커스텀을 함
    func encode(to encoder : Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        
        // 나이 범위 제약 추가
        guard (30...60).contains(age) else{
            throw EncodingError.invalidRange
        }
        
        try container.encode(age, forKey: .age)
        try container.encodeIfPresent(address, forKey: .address)    // optional 처리
    }
}

let p = Employee(name: "James", age: 30, address: "Seoul")      // age를 20으로 바꾸는 경우 encoding 실패

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do{
    let jsonData = try encoder.encode(p)
    if let jsonStr = String(data: jsonData, encoding: .utf8){
        print(jsonStr)
    }
}catch{
    print(error)
}
//: [Next](@next)
