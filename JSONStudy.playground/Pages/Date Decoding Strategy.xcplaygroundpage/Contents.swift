//: [Previous](@previous)

import Foundation

struct Product: Codable {
   var name: String
   var releaseDate: Date
}

let jsonStr = """
{
"name" : "iPad Pro",
"releaseDate" : "2018-10-30T23:00:00Z"
}
"""

guard let jsonData = jsonStr.data(using: .utf8) else {
   fatalError()
}

let decoder = JSONDecoder()

/*
    JSON
 1. 날짜 디코딩 수정 가능
 */

// 날짜 디코딩 수정 (1)
decoder.dateDecodingStrategy = .iso8601

do{
    let p = try decoder.decode(Product.self, from: jsonData)
    dump(p)
}catch{
    print(error)
}

//: [Next](@next)
