//
//  EquipmentLossesDto.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import Foundation

struct EquipmentLossesDto: Codable {
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let apc: Int
    let fieldArtillery: Int
    let mlr: Int
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int
    let navalShip: Int
    let antiAircraftWarfare: Int
    let cruiseMissiles: Int?
    let vehiclesAndFuelTanks: Int?
    let specialEquipment: Int?
    let greatestLossesDirection: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mlr = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case cruiseMissiles = "cruise missiles"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case specialEquipment = "special equipment"
        case greatestLossesDirection = "greatest losses direction"
    }
}
