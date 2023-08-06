//
//  Class.swift
//  TaTeTiTest
//
//  Created by Pedro Toledo on 4/8/23.
//

import Foundation
import SwiftUI

struct celda {
    
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile){
        case Tile.zero:
            return "O"
        case Tile.equis:
            return "X"
        default:
            return ""
        }
    }
    func tileColor() -> Color {
        switch(tile){
        case Tile.zero:
            return Color.blue
        case Tile.equis:
            return Color.red
        default:
            return Color.white
        }
    }
    
}


enum Tile {
    case zero
    case equis
    case empty
}

