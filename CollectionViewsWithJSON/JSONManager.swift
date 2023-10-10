//
//  JSONManager.swift
//  CollectionViewsWithJSON
//
//  Created by Güray Gül on 10.10.2023.
//

import Foundation

struct Person: Codable {
    let firstName, surname, gender: String
    let image: String
    let age: Int
    let address: Address
    let phoneNumbers: [PhoneNumber]
    
    static let allPeople: [Person] = Bundle.main.decode(file: "example.json")
    static let samplePerson: Person = allPeople[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

struct PhoneNumber: Codable {
    let type, number: String
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not find \(file) in the project")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not find \(file) in the project")
        }
        
        return loadedData
    }
}
