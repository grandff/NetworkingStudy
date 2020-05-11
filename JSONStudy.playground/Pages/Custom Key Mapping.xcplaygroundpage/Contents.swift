//: [Previous](@previous)

import Foundation

struct Person : Codable{
    var firstName : String
    var lastName : String
    var age : Int
    var address : String?
    
    // person 구조체의 새로운 열거형 생성
    enum CodingKeys : String, CodingKey{
        // case 이름과 동일한 키가 매핑
        case firstName
        case lastName
        case age
        case address = "homeAddress"
    }
}

let jsonStr = """
{
    "firstName" : "John",
    "age" : 30,
    "lastName" : "Doe",
    "homeAddress" : "Seoul",
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else{
    fatalError()
}

let decoder = JSONDecoder()

do{
    let p = try decoder.decode(Person.self, from: jsonData)
    dump(p)
}catch{
    print(error)
}

//: [Next](@next)
