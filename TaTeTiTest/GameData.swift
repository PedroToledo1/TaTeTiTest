//
//  GameData.swift
//  TaTeTiTest Watch App
//
//  Created by Pedro Toledo on 5/8/23.
//

import Foundation

class Juego: ObservableObject{
    
    @Published var board = [[celda]]()
    @Published var turnos = Tile.equis
    
        
        init(){
            resetBoard()
        }
    func posicion(row: Int, column: Int){
        if(board[row][column].tile != Tile.empty){
            return
        }
        board[row][column].tile = turnos == Tile.equis ? Tile.equis : Tile.zero
    }
        func resetBoard(){
            var tableroNuevo =  [[celda]]()
            
            for _ in (0...2){
                
                var row = [celda]()
                
                for _ in 0...2{
                    row.append(celda(tile: Tile.empty))
                }
                tableroNuevo.append(row)
            }
            board = tableroNuevo
        }
}
