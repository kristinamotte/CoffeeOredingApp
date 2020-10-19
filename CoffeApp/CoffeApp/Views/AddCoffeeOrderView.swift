//
//  AddCoffeeOrderView.swift
//  CoffeApp
//
//  Created by Kristina Motte on 10/19/20.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @ObservedObject private var addCoffeeOrderViewModel = AddCoffeOrderViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(cgColor: CGColor(red: 0.942, green: 0.958, blue: 1, alpha: 1))
        }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Information").font(.body)) {
                        TextField("Enter name", text: $addCoffeeOrderViewModel.name)
                    }
                    
                    Section(header: Text("Select your coffee").font(.body))  {
                        ForEach(addCoffeeOrderViewModel.coffeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: $addCoffeeOrderViewModel.coffeName)
                        }
                    }
                    
                    Section(header: Text("Select size").font(.body), footer: Text("Total")) {
                        Picker("", selection: $addCoffeeOrderViewModel.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place order") {
                        
                    }
                    .padding(EdgeInsets(top: 16, leading: 100, bottom: 16, trailing: 100))
                    .foregroundColor(Color.white)
                    .background(Color(CGColor(red: 0.221, green: 0.439, blue: 1, alpha: 1)))
                    .cornerRadius(4.0)
                }
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView()
    }
}