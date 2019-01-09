//
//  ModelMoney.swift
//  CourseRUB
//
//  Created by Yuriy on 09/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import Foundation



struct ModelMoney: Codable {
    let date, previousDate: Date
    let previousURL: String
    let timestamp: Date
    let valute: [String: Valute]
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case previousDate = "PreviousDate"
        case previousURL = "PreviousURL"
        case timestamp = "Timestamp"
        case valute = "Valute"
    }
}

struct Valute: Codable {
    let id, numCode, charCode: String
    let nominal: Int
    let name: String
    let value, previous: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
