//
//  FactModel.swift
//  Avocados
//
//  Created by Teemo Norman on 7/21/21.
//

import Foundation
import SwiftUI

//MARK: - FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
    
}
