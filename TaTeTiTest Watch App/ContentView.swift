//
//  ContentView.swift
//  TaTeTiTest Watch App
//
//  Created by Pedro Toledo on 4/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let borderSize = CGFloat(2)
        VStack (spacing: borderSize){
            ForEach(0...2, id: \.self){
                row in
                HStack (spacing: borderSize){
                    ForEach(0...2, id: \.self){
                        column in
                        Text("X")
                            .font(.system(size: 10))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.black)
                    }
                }
            }
        }
        .background(Color.white)
        .padding(3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
