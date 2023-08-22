//
//  Repository.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import Foundation

protocol Repository<T> {
    associatedtype T
    func getAll() -> [T]
}
