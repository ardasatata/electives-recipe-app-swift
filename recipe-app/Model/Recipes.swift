//
//  Categories.swift
//  recipe-app
//
//  Created by Arda on 9/29/22.
//

import Foundation

// MARK: - Recipe
struct Recipe: Codable, Identifiable {
    let id: Int
    let name: String
    let time: Int
    let difficulty: String
    let calories: Int
    let ingredients, steps: [String]
    let image: String
}

typealias Recipes = [Recipe]

