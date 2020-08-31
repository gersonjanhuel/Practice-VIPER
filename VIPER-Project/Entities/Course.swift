//
//  Course.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 28/08/20.
//

import Foundation

// this is our entity model
struct Course: Decodable {
    let id: Int
    let name: String
    let number_of_lessons: Int
}
