//
//  EquipmentLossesRepositoryImpl.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import Foundation

class EquipmentLossesRepositoryImpl: Repository {
    typealias T = EquipmentLossesDto
    
    func getAll() async throws -> [EquipmentLossesDto] {
        guard let url = URL(string: Constants.Endpoints.equipmentLosses.rawValue) else { return [] }
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode([EquipmentLossesDto].self, from: data)
            return result
    }
}
