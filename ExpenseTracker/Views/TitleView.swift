//
//  Title.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 26..
//

import SwiftUI

struct TitleView: View {
    
    var title = ""
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Utils.Colors.titleFont)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 50,
                alignment: .center)
            .background(Utils.Colors.titleBG)
            .cornerRadius(Utils.Corners.radius)
            .padding()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title : "Home")
    }
}
