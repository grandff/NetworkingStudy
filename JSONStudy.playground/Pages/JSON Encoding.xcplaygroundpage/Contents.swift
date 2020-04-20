//: [Previous](@previous)

import Foundation
import UIKit

struct Person : Codable{
    var firstName : String
    var lastName : String
    var birthDate : Date
    var address : String?
}

let p = Person(firstName : "John", lastName : "Doe", birthDate : Date(timeIntervalSince1970 : 1234567), address : "Seoul")

/*
    JSON
 1. Struct로 되어있는 데이터를 json으로 encoding
 --> 이 때 Struct에는 꼭 Codable을 붙여줘야함
 */

// JSON Encoding (1)
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do{
    let jsonData = try encoder.encode(p)
    
    if let jsonStr = String(data : jsonData, encoding : .utf8){
        print(jsonStr)
    }
}catch{
    print(error)
}

//: [Next](@next)
