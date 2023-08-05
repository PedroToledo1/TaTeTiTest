//
//  ContentView.swift
//  TaTeTiTest
//
//  Created by Pedro Toledo on 4/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var juego = Juego()
    
    var body: some View {
        
        let borderSize = CGFloat(5)
        
        VStack (spacing: borderSize){
            ForEach(0...2, id: \.self){
                row in
                HStack (spacing: borderSize){
                    ForEach(0...2, id: \.self){
                        column in
                        let cell = juego.board[row][column]
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                        
                            .onTapGesture {
                                juego.posicion(row: row, column: column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding(10)
        .alert(isPresented: $juego.PartidaFinalizada){
            Alert(title: Text(juego.mensajeFinal),
                  dismissButton: .default(Text("Juego Nuevo")){juego.resetBoard()})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
