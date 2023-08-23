//
//  PersonnelLossesRepositoryImpl.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

class PersonnelLossesRepositoryImpl: Repository {
    typealias T = PersonnelLossesDto
    
    func getAll() async throws -> [PersonnelLossesDto] {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else { return [] }
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode([PersonnelLossesDto].self, from: data)
            return result
    }
}
