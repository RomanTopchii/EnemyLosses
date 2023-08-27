//
//  EnemyLossesService.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

protocol EnemyLossesServiceDelegate {
    func presentData(losses: [Losses])
    func presentError(error: Error)
}

class EnemyLossesService {
    
    var delegate: EnemyLossesServiceDelegate?
    
    private var unitOfWork: UnitOfWork
    private var result: [Losses] = []
    
    init(unitOfWork: UnitOfWork) {
        self.unitOfWork = unitOfWork
    }
    
    func loadData() {
        result = []
        Task {
            do {
                let equipmentLosses = try await unitOfWork.equipmentLossesRepository.getAll()
                let personnelLosses = try await unitOfWork.personnelLossesRepository.getAll()
                
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
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    self.delegate?.presentData(losses: self.result)
                }
            }
            catch(let error) {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    self.delegate?.presentError(error: error)
                }
            }
        }
    }
}
