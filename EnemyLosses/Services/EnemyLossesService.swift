//
//  EnemyLossesService.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

protocol EnemyLossesServiceDelegate {
    func presentData(losses: [Losses])
}

class EnemyLossesService {
    
    var delegate: EnemyLossesServiceDelegate?
    
    private var equipmentLossesRepository: any Repository<EquipmentLossesDto>
    private var personnelLossesRepository: any Repository<PersonnelLossesDto>
    
    init(equipmentLossesRepository: any Repository<EquipmentLossesDto>,
         personnelLossesRepository: any Repository<PersonnelLossesDto>) {
        self.equipmentLossesRepository = equipmentLossesRepository
        self.personnelLossesRepository = personnelLossesRepository
    }
    var result: [Losses] = []
    
    func loadData() {
        result = []
        Task {
            do {
                let equipmentLosses = try await equipmentLossesRepository.getAll()
                let personnelLosses = try await personnelLossesRepository.getAll()
                
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
                
                DispatchQueue.main.async {
                    self.delegate?.presentData(losses: self.result)
                }
                
            }
            catch(let error){
                print(error)
            }
        }
    }
}
