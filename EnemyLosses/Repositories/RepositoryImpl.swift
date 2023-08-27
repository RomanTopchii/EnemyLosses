//
//  RepositoryImpl.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 27.08.2023.
//

import Foundation

class RepositoryImpl<T: Decodable>: Repository {
    
    public private(set) var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getAll() async throws -> [T] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([T].self, from: data)
        return result
    }
}
