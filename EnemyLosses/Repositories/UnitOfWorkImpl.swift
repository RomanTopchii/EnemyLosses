//
//  UnitOfWorkImpl.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 27.08.2023.
//

import Foundation

class UnitOfWorkImpl: UnitOfWork {
    
    public private(set) var equipmentLossesRepository: any Repository<EquipmentLossesDto>
    
    public private(set) var personnelLossesRepository: any Repository<PersonnelLossesDto>
    
    init() {
        equipmentLossesRepository = RepositoryImpl<EquipmentLossesDto>(url: URL(string: Constants.Endpoints.equipmentLosses)!)
        personnelLossesRepository = RepositoryImpl<PersonnelLossesDto>(url: URL(string: Constants.Endpoints.personnelLosses)!)
    }
}
