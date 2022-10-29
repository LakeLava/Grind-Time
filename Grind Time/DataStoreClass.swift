//
//  storetore.swift
//  Grind Time
//
//  Created by Nick DiGennaro on 10/29/22.
//

import Foundation
import SwiftUI

class DataStoreClass: ObservableObject {
    @Published var store: DataStore = DataStore()
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("store.data")
    }
    
    static func load(completion: @escaping (Result<DataStore, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success(DataStore()))
                    }
                    return
                }
                let DataStores = try JSONDecoder().decode(DataStore.self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(DataStores))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(store: [DataStore], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(store)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(store.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}

