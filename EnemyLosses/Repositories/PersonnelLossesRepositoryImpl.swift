//
//  PersonnelLossesRepositoryImpl.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

class PersonnelLossesRepositoryImpl: Repository {
    typealias T = PersonnelLossesDto
    
    func getAll() -> [PersonnelLossesDto] {
        return [PersonnelLossesDto(date: "2022-04-26", day: 3, personnel: 10000),
                PersonnelLossesDto(date: "2022-04-25", day: 2, personnel: 100),
                PersonnelLossesDto(date: "2022-04-24", day: 1, personnel: 100)]
    }
}
