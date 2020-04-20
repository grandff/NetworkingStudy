import Foundation
import UIKit

struct Person : Codable{
    var firstName: String
    var lastName: String
    var birthDate: Date
    var address: String?
}

let p = Person(firstName: "John", lastName: "Doe", birthDate: Date(timeIntervalSince1970: 1234567), address: "Seoul")


let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do {
   let jsonData = try encoder.encode(p)
   if let jsonStr = String(data: jsonData, encoding: .utf8) {
      print(jsonStr)
   }
} catch {
   print(error)
}


/*
    JSON
 1. Key encoding 방식을 변경할 수 있음
 --> 여기선 snake방식으로 변경
 
 */

// key encoding 규칙 변경 (1)
encoder.keyEncodingStrategy = .convertToSnakeCase

do{
    let jsonData = try encoder.encode(p)
    if let jsonStr = String(data : jsonData, encoding : .utf8){
        print(jsonStr)
    }
}catch{
    print(error)
}
