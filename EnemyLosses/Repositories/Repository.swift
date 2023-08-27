//
//  Repository.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import Foundation

protocol Repository<T>: AnyObject {
    associatedtype T
    
    var url: URL { get }
    
    func getAll() async throws -> [T]
}
