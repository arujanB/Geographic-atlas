//
//  ExpendedModel.swift
//  Geographic atlas
//
//  Created by Aruzhan Boranbay on 17.05.2023.
//

import Foundation

struct ExpendedModelDatum: Codable {
    var geographicModel: GeographicDatum
    var isExpended: Bool = false
}
