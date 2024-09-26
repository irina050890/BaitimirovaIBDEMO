//
//  UserModel.swift
//  BAITIMIROVA 3
//
//  Created by user on 25.09.2024.
//

import Foundation


struct UserModel: Codable {
    var id: UUID
    var name: String
    var phone: String
    var created_at: Date
}

