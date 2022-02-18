//
//  Ingredient.swift
//  CalcKulinar
//

//

import Foundation

struct Ingredient: Equatable {
    
    let title: String
    let density: Double
    
}

var ingredients = [
    Ingredient(title: "Рис", density: 0.91),
    Ingredient(title: "Вода", density: 1)
]

