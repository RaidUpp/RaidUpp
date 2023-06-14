//
//  FontSizeEnum.swift
//  RaidUpp
//
//  Created by Moyses Miranda do Vale Azevedo on 14/06/23.
//

import Foundation

enum FontSizeEnum: Int {
    case small = 20
    case medium = 22
    case large = 28
    case xlarge = 34

    public func rawValueCGFloat() -> CGFloat {
        return CGFloat(self.rawValue)
    }
}
