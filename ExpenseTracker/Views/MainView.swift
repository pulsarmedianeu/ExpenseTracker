//
//  MainView.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 26..
//

import SwiftUI


//--> This is the start point of Views, with Navigation system
struct MainView: View {
    
    @State private var isActive : Bool = false

    var body: some View {
        
        NavigationView{
            VStack{
                NavigationLink(
                    destination: DetailView(isActive: $isActive),
                    isActive: $isActive,
                    label:{
                      EmptyView()
                    })
                HomeView(isActive: $isActive)
            }
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
