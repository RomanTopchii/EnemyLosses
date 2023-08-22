//
//  PersonnelLossesDto.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

struct PersonnelLossesDto: Codable {
    let date: String
    let day: Int
    let personnel: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
    }
}
