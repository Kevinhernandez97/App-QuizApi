//
//  User.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    let name: String
}
