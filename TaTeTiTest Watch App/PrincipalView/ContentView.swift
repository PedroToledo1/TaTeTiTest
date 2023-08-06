//
//  ContentView.swift
//  TaTeTiTest Watch App
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
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(2,contentMode: .fit)
                            .background(Color.white)
                            .padding(1)
                            .onTapGesture {
                                juego.posicion(row: row, column: column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        
        .font(.system(size: 20))
        .alert(isPresented: $juego.PartidaFinalizada){
            Alert(title: Text(juego.mensajeFinal),
                  dismissButton: .default(Text("Juego Nuevo")){juego.resetBoard()})
            
        }

        HStack{
            Text(juego.turnosTexto())
                .font(.system(size: 9))
                .font(.title)
                .bold()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Button(action: {juego.PartidaFinalizada = true}, label: {Image(systemName: "gobackward")})
                .clipShape(Capsule())
                 .font(.system(size: 5))
                 .font(.title)
                 .bold()
                 .padding()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
