//
//  Losses.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

class Losses {
    
    public private(set) var date: Date
    public private(set) var day: Int
    public private(set) var items: [Item] = []
    public private(set) var greatestLossesDirection: String?
    
    init(date: Date,
         todayEquipmentLossesDto: EquipmentLossesDto,
         todayPersonnelLossesDto: PersonnelLossesDto,
         yesterdayEquipmentLossesDto: EquipmentLossesDto?,
         yesterdayPersonnelLossesDto: PersonnelLossesDto?) {
        
        self.date = date
        self.day = todayEquipmentLossesDto.day
        self.items.append(Item(name: "Personnel",
                               todayAmount: todayPersonnelLossesDto.personnel,
                               yesterdayAmount: yesterdayPersonnelLossesDto?.personnel))
        self.items.append(Item(name: "Aircraft",
                               todayAmount: todayEquipmentLossesDto.aircraft,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.aircraft))
        self.items.append(Item(name: "Helicopter",
                               todayAmount: todayEquipmentLossesDto.helicopter,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.helicopter))
        self.items.append(Item(name: "Tank",
                               todayAmount: todayEquipmentLossesDto.tank,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.tank))
        self.items.append(Item(name: "Armoured personnel carrier",
                               todayAmount: todayEquipmentLossesDto.apc,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.apc))
        self.items.append(Item(name: "Field artillery",
                               todayAmount: todayEquipmentLossesDto.fieldArtillery,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.fieldArtillery))
        self.items.append(Item(name: "MRL",
                               todayAmount: todayEquipmentLossesDto.mlr,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.mlr))
        self.items.append(Item(name: "Military auto",
                               todayAmount: todayEquipmentLossesDto.militaryAuto,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.militaryAuto))
        self.items.append(Item(name: "Fuel tank",
                               todayAmount: todayEquipmentLossesDto.fuelTank,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.fuelTank))
        self.items.append(Item(name: "Drone",
                               todayAmount: todayEquipmentLossesDto.drone,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.drone))
        self.items.append(Item(name: "Naval ship",
                               todayAmount: todayEquipmentLossesDto.navalShip,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.navalShip))
        self.items.append(Item(name: "Anti aircraft warfare",
                               todayAmount: todayEquipmentLossesDto.antiAircraftWarfare,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.antiAircraftWarfare))
        self.items.append(Item(name: "Cruise missiles",
                               todayAmount: todayEquipmentLossesDto.cruiseMissiles,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.cruiseMissiles))
        self.items.append(Item(name: "Vehicles and fuel tasks",
                               todayAmount: todayEquipmentLossesDto.vehiclesAndFuelTasks,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.vehiclesAndFuelTasks))
        self.items.append(Item(name: "Special equipment",
                               todayAmount: todayEquipmentLossesDto.specialEquipment,
                               yesterdayAmount: yesterdayEquipmentLossesDto?.specialEquipment))
        self.greatestLossesDirection = todayEquipmentLossesDto.greatestLossesDirection
    }
}
