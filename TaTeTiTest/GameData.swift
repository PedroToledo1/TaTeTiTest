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
    @Published var puntosEquis = 0
    @Published var puntosZeros = 0
    @Published var PartidaFinalizada = false
    @Published var mensajeFinal = "Empate"
    
        
        init(){
            resetBoard()
        }
    func posicion(row: Int, column: Int){
        if(board[row][column].tile != Tile.empty){
            return
        }
        board[row][column].tile = turnos == Tile.equis ? Tile.equis : Tile.zero
        
        
        if(partidaTerminada()){
            if (turnos == Tile.equis){
                puntosEquis += 1
            }else {
                puntosZeros += 1
            }
            let winner = turnos == Tile.equis ? "Cruz" : "Zeros"
            mensajeFinal = winner + "Gano!"
            PartidaFinalizada = true
        }else{
            turnos = turnos == Tile.equis ? Tile.zero : Tile.equis
        }
    }
    func partidaTerminada()->Bool{return false}
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
