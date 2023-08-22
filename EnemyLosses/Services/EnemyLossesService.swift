//
//  EnemyLossesService.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

class EnemyLossesService {
    
    private var equipmentLossesRepository: any Repository<EquipmentLossesDto>
    private var personnelLossesRepository: any Repository<PersonnelLossesDto>
    
    init(equipmentLossesRepository: any Repository<EquipmentLossesDto>,
         personnelLossesRepository: any Repository<PersonnelLossesDto>) {
        self.equipmentLossesRepository = equipmentLossesRepository
        self.personnelLossesRepository = personnelLossesRepository
    }
    
    func getAll() -> [Losses] {
        var equipmentLosses = equipmentLossesRepository.getAll()
        var personnelLosses = personnelLossesRepository.getAll()
        
        var result: [Losses] = []
        
        for todayEquipment in equipmentLosses {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: todayEquipment.date) {
                
                if let todayPersonnel = personnelLosses.first(where: { $0.day == todayEquipment.day }) {
                    let yesterdayEquipment = equipmentLosses.first(where: { $0.day == todayEquipment.day - 1 })
                    let yesterdayPersonnel = personnelLosses.first(where: { $0.day == todayEquipment.day - 1 })
                    
                    result.append(Losses(date: date,
                                         todayEquipmentLossesDto: todayEquipment,
                                         todayPersonnelLossesDto: todayPersonnel,
                                         yesterdayEquipmentLossesDto: yesterdayEquipment,
                                         yesterdayPersonnelLossesDto: yesterdayPersonnel))
                }
            }
        }
        return result
    }
}
