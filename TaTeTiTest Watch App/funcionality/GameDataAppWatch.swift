//
//  GameDataAppWatch.swift
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
    @Published var mensajeFinal = "¿otro?"
    
        
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
            mensajeFinal = winner + " Gano!"
            PartidaFinalizada = true
        }else{
            turnos = turnos == Tile.equis ? Tile.zero : Tile.equis
        }
    }
    
    func turnosTexto()-> String{
        return turnos == Tile.equis ? "Turno de 0" : "Turno de X"
    }
    func partidaTerminada()->Bool{
        if turnoEquis(0, 0) && turnoEquis(0,1) && turnoEquis(0,2){
            return true
        }
        if turnoEquis(1, 0) && turnoEquis(1,1) && turnoEquis(1,2){
            return true
        }
        if turnoEquis(2, 0) && turnoEquis(2,1) && turnoEquis(2,2){
            return true
        }
        if turnoEquis(0, 0) && turnoEquis(1,0) && turnoEquis(2,0){
            return true
        }
        if turnoEquis(0, 1) && turnoEquis(1,1) && turnoEquis(2,1){
            return true
        }
        if turnoEquis(0, 2) && turnoEquis(1,2) && turnoEquis(2,2){
            return true
        }
        if turnoEquis(0, 0) && turnoEquis(1,1) && turnoEquis(2,2){
            return true
        }
        if turnoEquis(2, 0) && turnoEquis(1,1) && turnoEquis(0,2){
            return true
        }
        return false
    }
    func turnoEquis(_ row: Int, _ column: Int)-> Bool{
        return board[row][column].tile == turnos
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
