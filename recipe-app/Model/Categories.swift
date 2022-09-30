//
//  Categories.swift
//  recipe-app
//
//  Created by Arda on 9/29/22.
//

import Foundation

// MARK: - Category
struct Category: Codable, Identifiable {
    let id: Int
    let label: String
}

typealias Categories = [Category]
