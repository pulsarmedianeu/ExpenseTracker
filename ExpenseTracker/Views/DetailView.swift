//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 25..
//

import SwiftUI

//--> Writable Item details 
struct DetailView: View {
    
    @StateObject private var etViewModel = ViewModel()
    @Binding var isActive : Bool
    
    
    var body: some View {
        
        VStack {
           
            VStack {
                
                TitleView(title:"Save Expense")
                
                    TextField("Enter new expense", text: $etViewModel.title)
                        .font(.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        
                    TextField("Amount", text: $etViewModel.amount )
                        .font(.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
            }
            
            
            VStack{
                
                Spacer()
               
                HStack {
                    
                    Button(action: {
                            isActive = false
                    }, label: {
                        Text("Cancel")
                            .font(.system(.largeTitle))
                            .frame(width: 150, height: 40)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                        .background(Utils.Colors.titleBG)
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),radius: 3, x: 3,y: 3)
                        
                    Spacer()
                    
                    Button(action: {
                        etViewModel.save()
                        etViewModel.getAllItems()
                            isActive = false
                    }, label: {
                        Text("Save")
                            .font(.system(.largeTitle))
                            .frame(width: 150, height: 40)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                        .background( Utils.Colors.titleBG)
                        .cornerRadius(20)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),radius: 3, x: 3,y: 3)
                }
                
            }.navigationBarHidden(true)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isActive: .constant(false) )
    }
}


