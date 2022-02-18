//
//  WeightMeasure.swift
//  CalcKulinar
//

//

import Foundation

enum MeasureType {
    case weight
    case volume
}

struct Measure {
    let measureType: MeasureType
    let title: String
    let coeff: Double
}

var measures = [
    Measure(measureType: .weight, title: "КГ", coeff: 1),
    Measure(measureType: .weight, title: "Г", coeff: 1_000),
    Measure(measureType: .weight, title: "МГ", coeff: 1_000_000),
    Measure(measureType: .volume, title: "Л", coeff: 1),
    Measure(measureType: .volume, title: "Куб.М", coeff: 0.001),
]


