//: [Previous](@previous)

import Foundation

struct Person: Codable {
   var firstName: String
   var lastName: String
   var age: Int
   var address: String?
}

let jsonStr = """
{
"first_name" : "John",
"age" : 30,
"last_name" : "Doe",
"address" : "Seoul"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}

let decoder = JSONDecoder()

/*
    JSON
 1. 만약 encoding, decoding 데이터의 키 값이 다르면 에러가 발생함
 2. 이경우 decoing 데이터의 키 값을 변경해서 해결
 */

// decoding key 변경 (1)
decoder.keyDecodingStrategy = .convertFromSnakeCase

do{
    let p = try decoder.decode(Person.self, from: jsonData)
    dump(p)
}catch{
    print(error)
}

//: [Next](@next)
