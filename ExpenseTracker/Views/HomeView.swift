//
//  HomeView.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 25..
//

import SwiftUI


struct HomeView: View {
    
    @StateObject private var etViewModel = ViewModel()
    @Binding var isActive : Bool
    
    func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = etViewModel.etItems[index]
            etViewModel.delete(task)
        }
        
        etViewModel.getAllItems()
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                TitleView(title:"Home")
                SumView(sum:etViewModel.sum)
                
                List {
                    ForEach(etViewModel.etItems, id: \.id) { item in
                        
                        VStack(alignment: .leading) {
                            Text(item.timestamp, formatter: dateFormatter)
                                .font(.footnote)
                                .padding(.bottom, 2)
                            HStack {
                                Text(item.title)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("\(item.amount) Ft")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                        }
                        
                    }.onDelete(perform: deleteTask)
                }
            }
            
            
            VStack{
                Spacer()
                
                //--> Float Button
                HStack {
                    Spacer()
                    Button(action: {
                        isActive = true
                    }, label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                        .background(Utils.Colors.titleBG)
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),radius: 3, x: 3,y: 3)
                }
            
            }
        }
        .onAppear(perform: {
            etViewModel.getAllItems()
        })
        //--> ZStack
    }
}


private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    return formatter
}()

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isActive: .constant(true))
    }
}


