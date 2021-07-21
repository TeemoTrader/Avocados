//
//  HeaderModel.swift
//  Avocados
//
//  Created by Teemo Norman on 7/21/21.
//

import Foundation
import SwiftUI

//MARK: - HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}


