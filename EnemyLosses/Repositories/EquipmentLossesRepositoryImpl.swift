//
//  EquipmentLossesRepositoryImpl.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import Foundation

class EquipmentLossesRepositoryImpl: Repository {
    typealias T = EquipmentLossesDto
    
    func getAll() -> [EquipmentLossesDto] {
        return [EquipmentLossesDto(date: "2022-04-26", day: 3, aircraft: 10000,
                               helicopter: 20000, tank: 100000, apc: 100000, fieldArtillery: 100, mlr: 100, militaryAuto: 100,
                               fuelTank: 100, drone: 100, navalShip: 100, antiAircraftWarfare: 100),
                EquipmentLossesDto(date: "2022-04-25", day: 2, aircraft: 100,
                               helicopter: 200, tank: 1000, apc: 1000, fieldArtillery: 100, mlr: 10000, militaryAuto: 100,
                               fuelTank: 100, drone: 100, navalShip: 100, antiAircraftWarfare: 100),
                EquipmentLossesDto(date: "2022-04-24", day: 1, aircraft: 100,
                               helicopter: 200, tank: 100, apc: 100, fieldArtillery: 100, mlr: 100, militaryAuto: 100,
                               fuelTank: 100, drone: 100, navalShip: 100, antiAircraftWarfare: 100)]
    }
}
