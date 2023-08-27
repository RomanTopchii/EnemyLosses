//
//  UnitOfWork.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 27.08.2023.
//

import Foundation

protocol UnitOfWork {
    var equipmentLossesRepository: any Repository<EquipmentLossesDto> { get }
    var personnelLossesRepository: any Repository<PersonnelLossesDto> { get }
}
