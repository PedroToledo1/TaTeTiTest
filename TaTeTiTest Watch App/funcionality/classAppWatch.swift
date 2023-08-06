//
//  classAppWatch.swift
//  TaTeTiTest Watch App
//
//  Created by Pedro Toledo on 5/8/23.
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
            return Color.pink
        case Tile.equis:
            return Color.purple
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
