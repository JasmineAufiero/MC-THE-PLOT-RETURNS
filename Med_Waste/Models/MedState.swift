//
//  State.swift
//  Med
//
//  Created by Jasmine Aufiero on 06/06/22.
//

import Foundation


enum MedState : Codable{ // force the box to have only three possible states
    case expired, donated, usable
}
