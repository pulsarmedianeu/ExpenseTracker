//
//  SumView.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 26..
//

import SwiftUI

struct SumView: View {
    
    var  sum = 0
    var body: some View {
        VStack {
            Text("Total:")
                .font(.title2)
                //.fontWeight( .bold)
            Text("\(sum) Ft")
                .font(.largeTitle)
        }
    }
}

struct SumView_Previews: PreviewProvider {
    static var previews: some View {
        SumView()
    }
}
