//: [Previous](@previous)

import Foundation

enum DecodingError: Error {
   case unknown
   case invalidRange
}

struct Employee: Codable {
   var name: String
   var age: Int
   var address: String?
   
   // 커스텀 디코딩 구현
    init(from decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey : .name)
        age = try container.decode(Int.self, forKey : .age)
        
        // age 범위 체크
        guard (30...60).contains(age) else{
            throw DecodingError.invalidRange
        }
        
        address = try container.decodeIfPresent(String.self, forKey : .address)
    }
   //
}

let jsonStr = """
{
"name" : "John",
"age" : 30,
"address" : "Seoul"
}
"""

// 마찬가지로 age를 20으로 바꾸면 에러가남

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}

let decoder = JSONDecoder()

do {
   let e = try decoder.decode(Employee.self, from: jsonData)
   dump(e)
} catch {
   print(error)
}



//: [Next](@next)
