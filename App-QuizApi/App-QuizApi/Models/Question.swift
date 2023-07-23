//
//  Question.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import Foundation

struct Question: Codable, Identifiable {
    let id: String
    let statement: String
    let options: [String]
    var answered: Bool = false
    
    enum CodingKeys: String, CodingKey {
       case id
       case statement
       case options
   }
}
